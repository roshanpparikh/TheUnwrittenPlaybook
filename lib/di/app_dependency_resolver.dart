import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:http/http.dart' as http;
import 'package:isar_community/isar.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification_cubit.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification_service.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/data/daily_fact_repository_impl.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/data/notification_settings_local_source.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/data/notification_settings_repository_impl.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/domain/daily_fact_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/domain/notification_settings_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/chat/emdeddings.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/repository/tips_repository.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/repository/tips_repository_impl.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/source/local_tip_source.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/source/local_tip_source_impl.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/source/remote_tip_source.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/source/remote_tip_source_impl.dart';
import 'package:upwork_the_unwritten_playbook/core/logger/app_logger.dart';
import 'package:upwork_the_unwritten_playbook/core/logger/composite_logger.dart';

import 'package:upwork_the_unwritten_playbook/data/repository/book_repository_impl.dart';
import 'package:upwork_the_unwritten_playbook/data/repository/quiz_repository_impl.dart';

import 'package:upwork_the_unwritten_playbook/data/repository/user_repository_impl.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/book_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/chapter_quiz_repository.dart';

import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/isar/embedded_chunk_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/clients/open_ai_client.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/clients/tts_remote_data_source.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/clients/tts_remote_data_source_impl.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/data_sources/tts_local_data_source.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/data_sources/tts_local_data_source_impl.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/repositories/tts_repository_impl.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/repositories/tts_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/use_cases/generate_chapter_speech_use_case.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/use_cases/generate_speech_use_case.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/use_cases/get_chapter_speech_use_case.dart';


class AppDependencyResolver {


  static void register(Isar isar) {
    DependencyProvider.registerSingleton<AppLogger>(
      CompositeLogger(
        trackers: [],
      ),
    );

    DependencyProvider.registerSingleton<EmbeddedChunkRepository>(
      EmbeddedChunkRepository(isar),
    );

    DependencyProvider.registerLazySingleton<UserRepository>(
          () => UserRepositoryImpl(
        DependencyProvider.get<AppLogger>(),
      ),
    );

    DependencyProvider.registerLazySingleton<BookRepository>(
          () => BookRepositoryImpl(
        DependencyProvider.get<AppLogger>(),
      ),
    );

    DependencyProvider.registerLazySingleton<QuizRepository>(
          () => ChapterQuizRepositoryImpl(null),
    );

    // -------------------------
    // TTS
    // -------------------------

    DependencyProvider.registerLazySingleton<http.Client>(
          () => http.Client(),
    );

    DependencyProvider.registerLazySingleton<OpenAiTtsClient>(
          () => OpenAiTtsClient(
        httpClient: DependencyProvider.get<http.Client>(),
        apiKey: openAIKey,
      ),
    );

    DependencyProvider.registerLazySingleton<TtsLocalDataSource>(
          () => TtsLocalDataSourceImpl(isar),
    );

    DependencyProvider.registerLazySingleton<TtsRemoteDataSource>(
          () => TtsRemoteDataSourceImpl(
        DependencyProvider.get<OpenAiTtsClient>(),
      ),
    );

    DependencyProvider.registerLazySingleton<TtsRepository>(
          () => TtsRepositoryImpl(
        local: DependencyProvider.get<TtsLocalDataSource>(),
        remote: DependencyProvider.get<TtsRemoteDataSource>(),
      ),
    );

    DependencyProvider.registerLazySingleton<GetChapterSpeechUseCase>(
          () => GetChapterSpeechUseCase(
        DependencyProvider.get<TtsRepository>(),
      ),
    );

    DependencyProvider.registerFactory<GenerateSpeechUseCase>(
          () => GenerateSpeechUseCase(
        DependencyProvider.get<TtsRepository>(),
      ),
    );

    DependencyProvider.registerLazySingleton<GenerateChapterSpeechUseCase>(
          () => GenerateChapterSpeechUseCase(
        DependencyProvider.get<TtsRepository>(),
      ),
    );



    DependencyProvider.registerLazySingleton<NotificationSettingsRepository>(
      () => NotificationSettingsRepositoryImpl(
        const NotificationSettingsLocalSource(),
      ),
    );

    DependencyProvider.registerLazySingleton<DailyFactRepository>(
      () =>  DailyFactRepositoryImpl(),
    );

    DependencyProvider.registerLazySingleton<NotificationService>(
      () => NotificationService(),
    );

    DependencyProvider.registerFactory<NotificationCubit>(
      () => NotificationCubit(
        settingsRepository: DependencyProvider.get<NotificationSettingsRepository>(),
        factRepository: DependencyProvider.get<DailyFactRepository>(),
        service: DependencyProvider.get<NotificationService>(),
        userRepository: DependencyProvider.get<UserRepository>(),
      ),
    );

    // -------------------------
    // Tips
    // -------------------------

    DependencyProvider.registerLazySingleton<LocalTipSource>(
      () => LocalTipSourceImpl(isar),
    );

    DependencyProvider.registerLazySingleton<RemoteTipSource>(
      () => RemoteTipSourceImpl(
        httpClient: DependencyProvider.get<http.Client>(),
        apiKey: openAIKey,
      ),
    );

    DependencyProvider.registerLazySingleton<TipsRepository>(
      () => TipsRepositoryImpl(
        local: DependencyProvider.get<LocalTipSource>(),
        remote: DependencyProvider.get<RemoteTipSource>(),
        embeddedChunkRepository: DependencyProvider.get<EmbeddedChunkRepository>(),
      ),
    );
  }
}