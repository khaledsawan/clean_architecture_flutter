import 'package:dartz/dartz.dart';
import '../../../../../constant/url/app_api_url.dart';
import '../../../../../core/base/base_repo.dart';
import '../../model/request/login/login_request.dart';
import '../../model/response/login/login_response_model.dart';
import '../../../domain/repository/login_repository.dart';

class LoginRepositoryImp extends MainRepository implements LoginRepository {
  LoginRepositoryImp({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  });

  @override
  Future<Either<dynamic, AuthResponseModel>> loginUser(
      LoginRequest loginRequest) async {

    final result = await data(
      getData: () => remoteData.post(
        body: loginRequest.toJson(),
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
