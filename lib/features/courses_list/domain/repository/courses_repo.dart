import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/courses.dart';

abstract class  CoursesRepository {
  Future<Either<dynamic, Courses>> getCourses();
}


