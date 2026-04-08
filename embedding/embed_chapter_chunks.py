#!/usr/bin/env python3
"""
Generate embeddings for prepared chapter chunks and save them to JSON.

Usage:
  export OPENAI_API_KEY=your_key
  python embed_chapter_chunks.py \
      --input chapter_chunks_for_embedding.json \
      --output embedded_chapter_chunks.json \
      --model text-embedding-3-small \
      --batch-size 50

Input format:
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

Output format:
[
  {
    "chunkId": "...",
    "chapterId": "...",
    "chapterTitle": "...",
    "kind": "...",
    "sectionTitle": "...",
    "order": 1,
    "text": "...",
    "embeddingModel": "text-embedding-3-small",
    "embeddingDimensions": 1536,
    "embedding": [...]
  }
]
"""
from __future__ import annotations

import argparse
import json
import os
import sys
import time
from pathlib import Path
from typing import Any

from openai import OpenAI


def load_items(path: Path) -> list[dict[str, Any]]:
    with path.open("r", encoding="utf-8") as f:
        data = json.load(f)

    if not isinstance(data, list):
        raise ValueError("Input JSON must be a list of chunk objects.")

    clean: list[dict[str, Any]] = []
    for index, item in enumerate(data, start=1):
        if not isinstance(item, dict):
            raise ValueError(f"Item #{index} is not an object.")
        text = str(item.get("text", "")).strip()
        if not text:
            continue
        clean.append(item)

    return clean


def batched(seq: list[dict[str, Any]], batch_size: int):
    for i in range(0, len(seq), batch_size):
        yield seq[i:i + batch_size]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, help="Path to prepared chunks JSON")
    parser.add_argument("--output", required=True, help="Path to save embedded JSON")
    parser.add_argument(
        "--model",
        default="text-embedding-3-small",
        help="Embedding model name",
    )
    parser.add_argument(
        "--batch-size",
        type=int,
        default=50,
        help="How many chunks to embed per request",
    )
    parser.add_argument(
        "--dimensions",
        type=int,
        default=None,
        help="Optional output dimension size if supported by the model",
    )
    parser.add_argument(
        "--sleep-seconds",
        type=float,
        default=0.0,
        help="Optional delay between requests",
    )
    args = parser.parse_args()

    api_key = os.getenv("OPENAI_API_KEY")
    if not api_key:
        print("OPENAI_API_KEY is not set.", file=sys.stderr)
        return 1

    input_path = Path(args.input)
    output_path = Path(args.output)

    items = load_items(input_path)
    if not items:
        print("No non-empty chunks found.")
        return 1

    client = OpenAI(api_key=api_key)

    embedded_items: list[dict[str, Any]] = []
    total = len(items)

    for batch_index, batch in enumerate(batched(items, args.batch_size), start=1):
        texts = [str(item["text"]) for item in batch]

        request_kwargs: dict[str, Any] = {
            "model": args.model,
            "input": texts,
        }
        if args.dimensions is not None:
            request_kwargs["dimensions"] = args.dimensions

        response = client.embeddings.create(**request_kwargs)

        if len(response.data) != len(batch):
            raise RuntimeError(
                f"Embedding count mismatch: expected {len(batch)}, got {len(response.data)}"
            )

        for item, emb in zip(batch, response.data):
            embedded_items.append(
                {
                    **item,
                    "embeddingModel": args.model,
                    "embeddingDimensions": len(emb.embedding),
                    "embedding": emb.embedding,
                }
            )

        done = len(embedded_items)
        print(
            f"Embedded batch {batch_index}: {done}/{total} chunks",
            flush=True,
        )

        if args.sleep_seconds > 0:
            time.sleep(args.sleep_seconds)

    with output_path.open("w", encoding="utf-8") as f:
        json.dump(embedded_items, f, ensure_ascii=False)

    print(f"Saved {len(embedded_items)} embedded chunks to {output_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
