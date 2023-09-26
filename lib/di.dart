import 'services/login_service.dart';
import 'services/Coursese_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/base/base_cache.dart';
import 'core/base/base_dio.dart';
import 'core/network/network_info.dart';
import 'data/repos/login_repo.dart';
import 'data/repos/courses_repo.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // use case
  getIt.registerLazySingleton<CoursesService>(() => CoursesService(getIt()));
  getIt.registerLazySingleton<LoginService>(() => LoginService(getIt()));

  //repo
  getIt.registerLazySingleton<CoursesRepository>(
    () => CoursesRepository(
      localData: getIt(),
      networkInfo: getIt(),
      remoteData: getIt(),
    ),
  );

  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepository(
      localData: getIt(),
      networkInfo: getIt(),
      remoteData: getIt(),
    ),
  );

  // Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton<TheHttpExecuter>(() => TheHttpExecuter());
  getIt.registerLazySingleton<Memento>(() => Memento(getIt()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Connectivity());
}
