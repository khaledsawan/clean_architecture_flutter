import 'package:dartz/dartz.dart';
import '../../../../../constant/url/app_api_url.dart';
import '../../../../../core/base/base_repo.dart';
import '../../../domain/repository/signup_repository.dart';
import '../../model/request/signup/signup_request.dart';
import '../../model/response/signup/signup_response_model.dart';

class SignUpRepositoryImp extends MainRepository implements SignUpRepository {
  SignUpRepositoryImp({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  });

  @override
  Future<Either<dynamic, AuthResponseModel>> signUpUser(
      SignUpRequest signRequest) async {
    print(signRequest.email);
    final result = await data(
      getData: () => remoteData.post(
        body: signRequest.toJson(),
        path: AppApiUrl.LOGIN_URL,
        headers: headerNoToken(),
        model: AuthResponseModel(),
      ),
      needCash: true,
      cashData: (data) {
        localData.saveAString(data.token, AppApiUrl.TOKEN);
        localData.saveAString(data.role, AppApiUrl.ROLE);
      },
    );
    return result.fold(
      (failure) {
        print(failure);
        return Left(failure);
      },
      (authResponse) => Right(authResponse),
    );
  }
}
