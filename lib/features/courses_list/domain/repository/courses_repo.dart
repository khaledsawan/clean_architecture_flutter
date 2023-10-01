import 'package:dartz/dartz.dart';

import '../entities/courses.dart';

abstract class  CoursesRepository {
  Future<Either<dynamic, Courses>> getCourses();
}


