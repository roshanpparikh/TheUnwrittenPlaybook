import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/book_repository.dart';
import 'package:upwork_the_unwritten_playbook/isar/embedded_chunk_repository.dart';
import 'package:uuid/uuid.dart';

import 'emdeddings.dart';
import 'send_chat_message_use_case.dart';

class ChatReply {
  final String id;
  final String text;

  ChatReply(this.text) : id = const Uuid().v4();
}

class ChatPageState {
  final bool isLoading;
  final ChatReply? latestReply;
  final String? chapterId;

  const ChatPageState({
    this.chapterId,
    this.isLoading = false, this.latestReply});

  ChatPageState copyWith({bool? isLoading, ChatReply? latestReply}) {
    return ChatPageState(
      isLoading: isLoading ?? this.isLoading,
      latestReply: latestReply,
    );
  }
}

class ChatPageCubit extends Cubit<ChatPageState> {
  SendChatMessageUseCase? _useCase;
  final BookRepository _bookRepo;
  final List<Map<String, String>> _chatMemory = [];

  Map<String, String> _chapters = {};

  ChatPageCubit(
      String? chapterId,
      this._bookRepo
      ) : super(ChatPageState(chapterId: chapterId)) {
    init();
     _bookRepo.getChapters().then((chapters) {
       _chapters = {
         for(final chapter in chapters)
          chapter.number.toString(): chapter.title
       };
     });
  }

  Future<void> init() async {
    final repo = DependencyProvider.get<EmbeddedChunkRepository>();
    final embeddings = OpenAIEmbeddings(
      apiKey: openAIKey,
      model: 'text-embedding-3-small',
    );
    _useCase = SendChatMessageUseCase(
      chunkRepository: repo,
      embeddings: embeddings,
    );
  }

  void loadHistory(List<Map<String, String>> history) {
    _chatMemory.addAll(history);
  }

  Future<void> sendMessage(String userMessage) async {
    if (_useCase == null) return;

    _chatMemory.add({'role': 'user', 'content': userMessage});
    emit(state.copyWith(isLoading: true, latestReply: null));

    final reply = await _useCase!.execute(
      chapterId: state.chapterId,
      userMessage: userMessage,
      chatMemory: List.unmodifiable(_chatMemory),
    );

    if (isClosed) return;

    if (reply != null) {
      _chatMemory.add({'role': 'assistant', 'content': reply});
      emit(state.copyWith(isLoading: false, latestReply: ChatReply(reply)));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }

  String? getChapterName(int id) {
    return _chapters[id.toString()];
  }
}
