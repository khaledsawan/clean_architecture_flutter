import 'package:clean_architecture_flutter/core/base/base_cache.dart';
import 'package:clean_architecture_flutter/core/base/base_dio.dart';
import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/core/network/network_info.dart';
import 'package:clean_architecture_flutter/di.dart';
import 'package:clean_architecture_flutter/features/courses_list/data/reposutory/courses_repository_imp.dart';
import 'package:clean_architecture_flutter/features/courses_list/domain/entities/courses.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockTheHttpExecuter extends Mock implements TheHttpExecuter {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CoursesRepositoryImp repository;
  late MockNetworkInfo networkInfo;
  late MockTheHttpExecuter remoteDataSource;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await init();
    networkInfo = MockNetworkInfo();
    remoteDataSource = MockTheHttpExecuter();
    repository = CoursesRepositoryImp(
      localData: getIt<Memento>(),
      networkInfo: networkInfo,
      remoteData: remoteDataSource,
    );
  });
  
  tearDown(() {
    getIt.reset();
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(networkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

   void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(networkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getCourses', () {
    final tCourses = Courses(/* Initialize with sample data */);
    runTestsOnline(() {
      test(
        'should check if the device is online',
        () async {
          // Arrange
          when(() => networkInfo.isConnected)
              .thenAnswer((realInvocation) async {
            return await true;
          } as Answering<Future<bool> Function()>);

          // Act
          repository.getCourses();

          // Assert
          verify(networkInfo.isConnected);
        },
      );
    });

    test(
      'should return courses when the call to remote data source is successful',
      () async {
        // Arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(remoteDataSource.get(
          path: anyNamed('path'),
          headers: anyNamed('headers'),
          model: Courses(),
        )).thenAnswer((_) async => tCourses);

        // Act
        final result = await repository.getCourses();

        // Assert
        expect(result, Right(tCourses));
      },
    );

    test(
      'should return a failure when the call to remote data source is unsuccessful',
      () async {
        // Arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(remoteDataSource.get(
          path: anyNamed('path'),
          headers: anyNamed('headers'),
          model: Courses(),
        )).thenThrow(
            ServerFailure('error')); // You need to define ServerFailure

        // Act
        final result = await repository.getCourses();

        // Assert
        expect(result, Left(ServerFailure('error')));
      },
    );

    test(
      'should return a failure when the device is offline',
      () async {
        // Arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);

        // Act
        final result = await repository.getCourses();

        // Assert
        expect(
            result,
            Left(NetworkFailure(
                'You are Offline'))); // You need to define NetworkFailure
      },
    );
  });
}
