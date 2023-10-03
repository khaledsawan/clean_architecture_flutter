import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/login/login_request.dart';
import '../../data/model/response/login/login_response_model.dart';
import '../repository/login_repository.dart';

class LoginUseCase extends UseCase<AuthResponseModel,LoginRequest> {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  @override
  Future<Either<dynamic,AuthResponseModel>> call(params) {
    return loginRepository.loginUser(params) ;
  }
}

