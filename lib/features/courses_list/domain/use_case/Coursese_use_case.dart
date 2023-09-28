import 'package:clean_architecture_flutter/core/usecases/usecase.dart';
import 'package:clean_architecture_flutter/features/courses_list/domain/entities/courses.dart';
import 'package:dartz/dartz.dart';

import '../repository/courses_repo.dart';

class CoursesUseCase extends UseCase<Courses, NoParams> {
  final CoursesRepository coursesRepository;

  CoursesUseCase(this.coursesRepository);
  @override
  Future<Either<dynamic, Courses>> call(param) async =>
      await coursesRepository.getCourses();
}
