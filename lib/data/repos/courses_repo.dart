import 'package:clean_architecture_flutter/constant/url/app_api_url.dart';
import 'package:dartz/dartz.dart';
import '../../core/base/base_repo.dart';
import '../models/response/courses/courses.dart';

class CoursesRepository extends MainRepository {
  CoursesRepository({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  });
  Future<Either<dynamic, dynamic>> getCourses() async => await data(
        getData: () => remoteData.get(
          path: AppApiUrl.STUDENT_COURSES_URL,
          headers: headers,
          model: Courses(),
        ),
        needCash: false,
      );
}
