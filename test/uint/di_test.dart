import 'package:clean_architecture_flutter/core/base/base_cache.dart';
import 'package:clean_architecture_flutter/core/base/base_dio.dart';
import 'package:clean_architecture_flutter/core/network/network_info.dart';
import 'package:clean_architecture_flutter/features/Login/domain/repository/login_repository.dart';
import 'package:clean_architecture_flutter/features/Login/domain/use_case/login_use_case.dart';
import 'package:clean_architecture_flutter/features/courses_list/domain/repository/courses_repo.dart';
import 'package:clean_architecture_flutter/features/courses_list/domain/use_case/Coursese_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:clean_architecture_flutter/features/Login/presentation/bloc/login_bloc.dart';
import 'package:clean_architecture_flutter/di.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

import '../shared_test.dart';



void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetIt getIt;
  late FakeSharedPreferencesStore store;
  late SharedPreferences preferences;

  const String testString = 'hello world';
  const bool testBool = true;
  const int testInt = 42;
  const double testDouble = 3.14159;
  const List<String> testList = <String>['foo', 'bar'];
  const Map<String, Object> testValues = <String, Object>{
    'flutter.String': testString,
    'flutter.bool': testBool,
    'flutter.int': testInt,
    'flutter.double': testDouble,
    'flutter.List': testList,
  };

  setUp(() async {
    store = FakeSharedPreferencesStore(testValues);
    SharedPreferencesStorePlatform.instance = store;
    preferences = await SharedPreferences.getInstance();
    getIt = GetIt.instance;

  });

  tearDown(() {
    // Clear GetIt registrations after each test
    getIt.reset();
  });

  test('Test dependency registration', () async {
    await init();
    // Verify that the dependencies are registered correctly
    expect(getIt<LoginBloc>(), isNotNull);
    expect(getIt<CoursesUseCase>(), isNotNull);
    expect(getIt<LoginUseCase>(), isNotNull);
    expect(getIt<CoursesRepository>(), isNotNull);
    expect(getIt<LoginRepository>(), isNotNull);
    expect(getIt<NetworkInfo>(), isNotNull);
    expect(getIt<TheHttpExecuter>(), isNotNull);
    expect(getIt<Memento>(), isNotNull);
    expect(getIt<SharedPreferences>(), equals(preferences));
    expect(getIt<InternetConnectionChecker>(),
        equals(InternetConnectionChecker()));
  });
}
