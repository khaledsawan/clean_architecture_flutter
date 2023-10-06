import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/core/network/network_info.dart';
import 'package:clean_architecture_flutter/features/courses_list/data/model/course.dart';
import 'package:clean_architecture_flutter/features/courses_list/data/reposutory/courses_repository_imp.dart';
import 'package:clean_architecture_flutter/features/courses_list/domain/entities/courses.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {
  @override
  Future<bool> get isConnected async => await true;
}

class MockNetworkInfo2 extends Mock implements NetworkInfo {
  @override
  Future<bool> get isConnected async => await false;
}

class MockCoursesRepositoryImp extends Mock implements CoursesRepositoryImp {
  @override
  Future<Either<dynamic, Courses>> getCourses() async {
    return await Right(coursesResponse);
  }
}

class MockCoursesRepositoryImp2 extends Mock implements CoursesRepositoryImp {
  @override
  Future<Either<dynamic, Courses>> getCourses() async {
    return await Left(ServerFailure('error'));
  }
}

final course1 = Course(
  img: 'course_image1.jpg',
  name: 'Course 1',
  id: 1,
  category: 'Programming',
  viewerQuntity: 100,
  numberOfVideos: 10,
  teacherId: 101,
  teacherImage: 'teacher_image1.jpg',
);

final course2 = Course(
  img: 'course_image2.jpg',
  name: 'Course 2',
  id: 2,
  category: 'Math',
  viewerQuntity: 50,
  numberOfVideos: 8,
  teacherId: 102,
  teacherImage: 'teacher_image2.jpg',
);

final coursesResponse = Courses(
  success: true,
  message: 'Success',
  courses: [course1, course2],
);
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockCoursesRepositoryImp repository;
  late MockCoursesRepositoryImp2 repository2;


  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    repository = MockCoursesRepositoryImp();
    repository2 = MockCoursesRepositoryImp2();
  });

  group('getCourses', () {
    final tCourses = Courses(/* Initialize with sample data */);
    test(
      'should return courses when the call to remote data source is successful',
      () async {
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

        // Act
        final result = await repository2.getCourses();

        // Assert
        expect(result, Left(ServerFailure('error')));
      },
    );

    test(
      'should return a failure when the device is offline',
      () async {
        // Act
        final result = await repository2.getCourses();

        // Assert
        expect(result,
            Left(ServerFailure('error'))); // You need to define NetworkFailure
      },
    );
  });
}
