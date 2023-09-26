import 'package:dartz/dartz.dart';

import '../../constant/url/app_api_url.dart';
import '../../core/base/base_repo.dart';
import '../models/request/login/login_request.dart';
import '../models/response/login/login_response_model.dart';

class LoginRepository extends MainRepository {
  LoginRepository({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  });
 

  Future<Either<dynamic, dynamic>> login(
          {required LoginRequest loginRequest}) async =>
      await data(
        getData: () => remoteData.post(
          body: loginRequest.toJson(),
          path: AppApiUrl.LOGIN_URL,
          headers: headerNoToken(),
          model: LoginResponseModel(),
        ),
        needCash: true,
        cashData: (data) {
          localData.saveAString(data.token, AppApiUrl.TOKEN);
          localData.saveAString(data.role, AppApiUrl.ROLE);
        },
      );
}
