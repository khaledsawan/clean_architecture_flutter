import 'package:dartz/dartz.dart';

import '../data/models/request/login/login_request.dart';
import '../data/repos/login_repo.dart';

class LoginService {
  final LoginRepository loginRepository;

  LoginService(this.loginRepository);

  Future<Either<dynamic, dynamic>> login({required LoginRequest loginRequest}) {
    return loginRepository.login(loginRequest: loginRequest);
  }
}
