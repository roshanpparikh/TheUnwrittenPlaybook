# How the Chat Tab Works

## Overview

The chat tab lets users have a conversation with a **Book Assistant** — an AI guide for *The Unwritten Playbook*. It uses **RAG (Retrieval-Augmented Generation)**: the user's message is used to find relevant book passages, which are then sent alongside the conversation to GPT-4o.

The chat supports two modes:
- **Global chat** (`ChatPage()`) — scoped to all chapters.
- **Chapter chat** (`ChatPage.chapter(id: chapterId)`) — scoped to a specific chapter; messages and chunk retrieval are filtered by that chapter.

---

## File Responsibilities

| File | Role |
|---|---|
| `lib/chat/chat_page.dart` | UI — renders the chat, handles user input, displays messages and typing indicator |
| `lib/chat/chat_page_cubit.dart` | State management — owns chat memory, chapter map, wires up the use case |
| `lib/chat/send_chat_message_use_case.dart` | Business logic — RAG retrieval + GPT-4o call |
| `lib/chat/isar_chat_controller.dart` | Persistence — Isar-backed `ChatController` scoped by `chapterId` |
| `lib/chat/emdeddings.dart` | Infrastructure — thin OpenAI embeddings HTTP client |

---

## Generating Embedded Chapter Chunks

When the book content changes, you need to re-generate `assets/json/embedded_chapter_chunks.json` using `embedding/embed_chapter_chunks.py`.

### Prerequisites

```bash
pip install openai
export OPENAI_API_KEY=your_key_here
```

### Run

```bash
cd embedding
python embed_chapter_chunks.py \
    --input chapter_chunks_for_embedding.json \
    --output embedded_chapter_chunks.json \
    --model text-embedding-3-small \
    --batch-size 50
```

Then copy the output into the Flutter asset:

```bash
cp embedding/embedded_chapter_chunks.json assets/json/embedded_chapter_chunks.json
```

### Input format (`chapter_chunks_for_embedding.json`)

A JSON array of chunk objects:

```json
[
  {
    "chunkId": "chapter_1_section_1",
    "chapterId": "1",
    "chapterTitle": "...",
    "kind": "section",
    "sectionTitle": "The Two Educations",
    "order": 1,
    "text": "..."
  }
]
```

Chunks with an empty `text` field are skipped automatically.

### Optional flags

| Flag | Default | Description |
|---|---|---|
| `--model` | `text-embedding-3-small` | OpenAI embedding model |
| `--batch-size` | `50` | Chunks per API request |
| `--dimensions` | _(model default)_ | Output vector size (if model supports it) |
| `--sleep-seconds` | `0` | Delay between batches (rate-limit safety) |

### After re-generating

Bump the `version` string in `main.dart` so the app re-seeds on next launch:

```dart
await seedService.ensureSeeded(
  assetPath: 'assets/json/embedded_chapter_chunks.json',
  version: 'v2', // increment this
);
```

---

## Embedding Seed (app startup)

Before the chat can work, book chunks with pre-computed embeddings must be loaded into Isar. This happens once in `main()`:

```dart
final seedService = EmbeddedChunkSeedService(isar);
await seedService.ensureSeeded(
  assetPath: 'assets/json/embedded_chapter_chunks.json',
  version: 'v1',
);
```

**`EmbeddedChunkSeedService.ensureSeeded()`** (`lib/isar/embedded_seed_chunk_service.dart`):
1. Checks `AppSeedStateIsar` for a stored seed version keyed by `embedded_chunks_seed_version`.
2. If the stored version matches the requested `version` (`'v1'`), skips seeding (no-op).
3. Otherwise, loads `assets/json/embedded_chapter_chunks.json` from the asset bundle, decodes it as a `List`, maps each entry to `EmbeddedChunkIsar`, clears the existing collection, and bulk-inserts all chunks in a single Isar write transaction.
4. Saves the new version string so future launches skip re-seeding.

To force a re-seed (e.g. after updating the JSON asset), pass `force: true` or bump the `version` string.

---

## Data Flow

### On startup

1. `ChatPage` creates `ChatPageCubit(chapterId, bookRepository)` and `init()` is called in the constructor.
2. `init()` retrieves `EmbeddedChunkRepository` from `DependencyProvider` and constructs `SendChatMessageUseCase`.
3. `ChatPageCubit` also calls `BookRepository.getChapters()` to build a `chapterId → title` map for chapter name display.
4. `_ChatPageViewState.initState()` waits for `AppIsar.instance()`, then creates `IsarChatController(isar, chapterId)` (which loads only messages matching `chapterId`).
5. History is read from the controller and passed to `cubit.loadHistory()` to seed GPT's conversation memory.

### When the user sends a message

1. `_onSendPressed` inserts a `TextMessage` (user) into `IsarChatController` → persisted to Isar, shown in UI immediately.
2. A fake **"Thinking…"** message (id prefixed with `_kTypingMessageId`) is inserted via `_chatController.toggleLoadingMessage()` — shows a `IsTypingIndicator` in the UI while waiting.
3. `ChatPageCubit.sendMessage()` is called:
   - Appends `{role: user, content: ...}` to `_chatMemory`.
   - Calls `SendChatMessageUseCase.execute(userMessage, chatMemory, chapterId)`:
     - Embeds the user message via OpenAI `text-embedding-3-small`.
     - Retrieves top-5 most relevant book chunks from Isar filtered by `chapterId` (or global if null).
     - Builds a system prompt (tone, role, language guidance) with injected book context passages.
     - POSTs to `gpt-4o` with the last 5 chat turns as context.
   - On success: appends the reply to `_chatMemory` and emits `ChatPageState` with `latestReply`.
4. `BlocListener` detects the new reply and calls `_handleNewReply()`:
   - Calls `_chatController.toggleLoadingMessage(loadingMessage, resultMessage: ...)`.
   - This **replaces** the fake thinking message with the real reply (single `ChatOperation.update`), or falls back to `insert` if the fake was lost.
   - Triggers `setState()` to update `_lastBookAssistantMessageId` for styling.

---

## Persistence

- **Messages** are stored in Isar via `IsarChatController` using `ChatMessageIsar` records (JSON-encoded, sorted by `createdAt`). Each record stores a `chapterId` field so global vs. chapter chats are isolated.
- **Book chunks with embeddings** are pre-loaded into Isar (`EmbeddedChunkRepository`) and searched by cosine similarity at query time, optionally filtered by `chapterId`.

---

## Message Rendering

`_textMessageBuilder` in `chat_page.dart` handles all bubble rendering:

- **Typing indicator** — messages whose id starts with `_kTypingMessageId` render a "Thinking" label + `IsTypingIndicator` widget instead of text.
- **User messages** — green tint (`Colors.green.shade100`), right-aligned.
- **Book Assistant's latest message** — light blue tint (`Colors.lightBlue.shade50`), blue text (`Colors.blue.shade900`).
- **Older Book Assistant messages** — grey (`Colors.grey.shade200`), black87 text.
- **Chapter link** — if the message metadata contains a `chapterId` and the chat is in global mode, a tappable underlined chapter title is shown above the message text. Tapping navigates to the chapter page via `AppBloc` / `NavigationAction`.
- Timestamp (`HH:mm`) shown below each message.

---

## System Prompt Behavior

`SendChatMessageUseCase` constructs a system prompt that instructs the assistant to:

- Act as an in-app guide for *The Unwritten Playbook*, not the author.
- Speak in a calm, intelligent, and encouraging tone.
- Answer primarily from retrieved book context; be honest when context is insufficient.
- Keep answers to 3–6 sentences with one practical takeaway or reflection question.
- Connect topics (status, confidence, networking, etc.) to principles, not manipulation.
- Respond in the same language as the user (English preferred).
