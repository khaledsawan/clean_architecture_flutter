import 'package:dartz/dartz.dart';

import '../../data/model/request/login/login_request.dart';
import '../../data/model/response/login/login_response_model.dart';


abstract class LoginRepository {
  Future<Either<dynamic, AuthResponseModel>> loginUser(
      LoginRequest loginRequest);
}
