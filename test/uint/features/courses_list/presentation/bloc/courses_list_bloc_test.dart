import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/core/usecases/usecase.dart';
import 'package:clean_architecture_flutter/features/courses_list/data/model/course.dart';
import 'package:clean_architecture_flutter/features/courses_list/domain/entities/courses.dart';
import 'package:clean_architecture_flutter/features/courses_list/domain/use_case/Coursese_use_case.dart';
import 'package:clean_architecture_flutter/features/courses_list/presentation/bloc/courses_list_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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

class MockCoursesListBloc extends MockBloc<CoursesListEvent, CoursesListState>
    implements CoursesListBloc {}

class MockCoursesUseCase extends Mock implements CoursesUseCase {
  @override
  Future<Either<dynamic, Courses>> call(NoParams param) async {
    return await Right(coursesResponse);
  }
}

class MockCoursesUseCase2 extends Mock implements CoursesUseCase {
  @override
  Future<Either<dynamic, Courses>> call(NoParams param) async {
    return await Left(ServerFailure('error'));
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CoursesListBloc coursesListBloc;
  late CoursesListBloc coursesListBloc2;
  late MockCoursesUseCase coursesUseCase;
  late MockCoursesUseCase2 coursesUseCase2;

  setUp(() async {
    coursesUseCase = MockCoursesUseCase();
    coursesUseCase2 = MockCoursesUseCase2();
    coursesListBloc = CoursesListBloc(coursesUseCase);
    coursesListBloc2 = CoursesListBloc(coursesUseCase2);
  });

  tearDown(() {
    coursesListBloc.close();
    coursesListBloc2.close();
  });
  blocTest<CoursesListBloc, CoursesListState>('CoursesListInitial',
      build: () => coursesListBloc,
      wait: Duration(microseconds: 1),
      expect: () => []);

  blocTest<CoursesListBloc, CoursesListState>(
    'emits [CoursesListLoading, CoursesListLoaded] when GetCoursesList is added successfully',
    build: () => coursesListBloc,
    act: (bloc) => bloc.add(GetCoursesList()),
    expect: () => [
      CoursesListLoading(),
      CoursesListLoaded(coursesResponse),
    ],
  );

  blocTest<CoursesListBloc, CoursesListState>(
    'emits [CoursesListLoading, CoursesListFail] when GetCoursesList fails',
    build: () => coursesListBloc2,
    act: (bloc) => bloc.add(GetCoursesList()),
    expect: () => [
      CoursesListLoading(),
      CoursesListFail(),
    ],
  );
}
