import '../../../../core/usecases/usecase.dart';
import '../entities/courses.dart';
import 'package:dartz/dartz.dart';

import '../repository/courses_repo.dart';

class CoursesUseCase extends UseCase<Courses, NoParams> {
  final CoursesRepository coursesRepository;

  CoursesUseCase(this.coursesRepository);
  @override
  Future<Either<dynamic, Courses>> call(param) async =>
      await coursesRepository.getCourses();
}
