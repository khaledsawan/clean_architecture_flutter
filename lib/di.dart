import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/base/base_cache.dart';
import 'core/base/base_dio.dart';
import 'core/network/network_info.dart';
import 'features/Login/data/repository/login_repository_imp.dart/login_repo.dart';
import 'features/Login/domain/repository/login_repository.dart';
import 'features/Login/domain/use_case/login_use_case.dart';
import 'features/courses_list/data/reposutory/courses_repository_imp.dart';
import 'features/courses_list/domain/repository/courses_repo.dart';
import 'features/courses_list/domain/use_case/Coursese_use_case.dart';
import 'features/message/data/repositories/push_notification_repository_service_impl.dart';
import 'features/message/data/service/firebase_messageing_service.dart';
import 'features/message/domain/repositories/push_notification_reporsitory.dart';
import 'features/message/domain/usecases/check_permissions_usecase.dart';
import 'features/message/domain/usecases/get_token_stream_usecase.dart';
import 'features/message/domain/usecases/init_notifications_usecase.dart';
import 'features/message/domain/usecases/request_permissions_usecase.dart';
import 'features/message/presentation/cubit/pushnotification_cubit.dart';

final GetIt getIt = GetIt.instance;

class AppDependencies {
  Future<void> initialize() async {
    await dotenv.load();
    // Business logic
    getIt.registerLazySingleton<PushNotificationBloc>(() =>
        PushNotificationBloc(
            requestPermissionsUseCase: getIt<RequestPermissionsUseCase>(),
            checkPermissionsUseCase: getIt<CheckPermissionsUseCase>(),
            initNotificationsUseCase: getIt<InitNotificationsUseCase>(),
            getTokenStreamUseCase: getIt<GetTokenStreamUseCase>()));

    // Use cases
    getIt.registerLazySingleton<CoursesUseCase>(
        () => CoursesUseCase(getIt<CoursesRepository>()));

    getIt.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(getIt<LoginRepository>()));

    getIt.registerLazySingleton<RequestPermissionsUseCase>(
        () => RequestPermissionsUseCase(getIt<PushNotificationRepository>()));
    getIt.registerLazySingleton<CheckPermissionsUseCase>(
        () => CheckPermissionsUseCase(getIt<PushNotificationRepository>()));
    getIt.registerLazySingleton<InitNotificationsUseCase>(
        () => InitNotificationsUseCase(getIt<PushNotificationRepository>()));
    getIt.registerLazySingleton<GetTokenStreamUseCase>(
        () => GetTokenStreamUseCase(getIt<PushNotificationRepository>()));

    // Repositories
    getIt.registerLazySingleton<CoursesRepository>(
      () => CoursesRepositoryImp(
        localData: getIt<Memento>(),
        networkInfo: getIt<NetworkInfo>(),
        remoteData: getIt<TheHttpExecuter>(),
      ),
    );

    getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImp(
        localData: getIt<Memento>(),
        networkInfo: getIt<NetworkInfo>(),
        remoteData: getIt<TheHttpExecuter>(),
      ),
    );

    getIt.registerLazySingleton<PushNotificationRepository>(
      () => PushNotificationRepositoryImpl(
          firebaseService: getIt<FirebaseMessageService>()),
    );

    // services
    final FirebaseMessageService firebaseMessageService = FirebaseMessageService();
    await firebaseMessageService.init();
    getIt.registerLazySingleton(() => firebaseMessageService);

    // Core
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt<InternetConnection>()));
    getIt.registerLazySingleton<TheHttpExecuter>(() => TheHttpExecuter());
    getIt.registerLazySingleton<Memento>(() => Memento(getIt<SharedPreferences>()));

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);
    getIt.registerLazySingleton(() => InternetConnection());
  }
}
