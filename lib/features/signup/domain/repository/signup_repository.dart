import 'package:dartz/dartz.dart';

import '../../data/model/request/signup/signup_request.dart';
import '../../data/model/response/signup/signup_response_model.dart';

abstract class SignUpRepository {
  Future<Either<dynamic, AuthResponseModel>> signUpUser(
      SignUpRequest signUpRequest);
}
