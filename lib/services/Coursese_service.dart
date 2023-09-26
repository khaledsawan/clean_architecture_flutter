import 'package:dartz/dartz.dart';
import '../data/repos/courses_repo.dart';

class CoursesService {
  final CoursesRepository coursesRepository;

  CoursesService(this.coursesRepository);

  Future<Either<dynamic, dynamic>> getCourses() async =>
      await coursesRepository.getCourses();
}
