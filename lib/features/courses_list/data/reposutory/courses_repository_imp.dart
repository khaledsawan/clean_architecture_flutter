import 'package:dartz/dartz.dart';

import '../../../../constant/url/app_api_url.dart';
import '../../../../core/base/base_repo.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/courses.dart';
import '../../domain/repository/courses_repo.dart';

class CoursesRepositoryImp extends MainRepository implements CoursesRepository {
  CoursesRepositoryImp({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  });
  Future<Either<dynamic, Courses>> getCourses() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      final result = await data(
        getData: () => remoteData.get(
          path: AppApiUrl.STUDENT_COURSES_URL,
          headers: headers,
          model: Courses(),
        ),
        needCash: false,
      );
      return result.fold((l) => Left(l), (Courses) => Right(Courses));
    } else {
      return Left(NetworkFailure('You Are Offline'));
    }
  }
}
