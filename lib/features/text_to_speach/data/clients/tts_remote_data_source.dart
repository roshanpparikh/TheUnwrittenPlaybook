abstract class TtsRemoteDataSource {
  Future<List<int>> synthesizeText({
    required String text,
    required String voiceId,
    required String format,
  });
}