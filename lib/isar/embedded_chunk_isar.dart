import 'package:isar_community/isar.dart';

part 'embedded_chunk_isar.g.dart';

@collection
class EmbeddedChunkIsar {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String chunkId;

  @Index()
  late String chapterId;

  String? chapterTitle;

  @Index()
  late String kind;

  String? sectionTitle;

  int? order;

  late String text;

  String? embeddingModel;

  int? embeddingDimensions;

  late List<double> embedding;

  DateTime? importedAt;

  EmbeddedChunkIsar();

  factory EmbeddedChunkIsar.fromJson(Map<String, dynamic> json) {
    return EmbeddedChunkIsar()
      ..chunkId = json['chunkId'] as String
      ..chapterId = json['chapterId'].toString()
      ..chapterTitle = json['chapterTitle'] as String?
      ..kind = json['kind'] as String
      ..sectionTitle = json['sectionTitle'] as String?
      ..order = (json['order'] as num?)?.toInt()
      ..text = json['text'] as String
      ..embeddingModel = json['embeddingModel'] as String?
      ..embeddingDimensions = (json['embeddingDimensions'] as num?)?.toInt()
      ..embedding = (json['embedding'] as List)
          .map((e) => (e as num).toDouble())
          .toList()
      ..importedAt = DateTime.now();
  }
}