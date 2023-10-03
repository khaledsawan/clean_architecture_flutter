import '../../../../constant/url/app_api_url.dart';
import '../../domain/repository/courses_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/base/base_repo.dart';
import '../../domain/entities/courses.dart';

class CoursesRepositoryImp extends MainRepository implements CoursesRepository {
  CoursesRepositoryImp({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  });
  Future<Either<dynamic, Courses>> getCourses() async {
    final result=await data(
      getData: () => remoteData.get(
        path: AppApiUrl.STUDENT_COURSES_URL,
        headers: headers,
        model: Courses(),
      ),
      needCash: false,
    );
  return result.fold((l) => Left(l), (Courses) => Right(Courses));
  }
}
