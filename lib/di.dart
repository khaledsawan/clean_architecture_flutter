import 'package:clean_architecture_flutter/features/courses_list/data/reposutory/courses_repository_imp.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/base/base_cache.dart';
import 'core/base/base_dio.dart';
import 'core/network/network_info.dart';
import 'features/Login/data/repository/login_repository_imp.dart/login_repo.dart';
import 'features/Login/domain/repository/login_repository.dart';
import 'features/Login/domain/use_case/login_use_case.dart';
import 'features/Login/presentation/bloc/login_bloc.dart';
import 'features/courses_list/domain/repository/courses_repo.dart';
import 'features/courses_list/domain/use_case/Coursese_use_case.dart';
  final GetIt getIt = GetIt.instance;
class AppDependencies {


  Future<void> initialize() async {
    // Business logic
    getIt.registerLazySingleton<LoginBloc>(() => LoginBloc(getIt()));

    // Use cases
    getIt.registerLazySingleton<CoursesUseCase>(() => CoursesUseCase(getIt()));
    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));

    // Repositories
    getIt.registerLazySingleton<CoursesRepository>(
      () => CoursesRepositoryImp(
        localData: getIt(),
        networkInfo: getIt(),
        remoteData: getIt(),
      ),
    );

    getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImp(
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
    getIt.registerLazySingleton(() => InternetConnectionChecker());
  }
}


