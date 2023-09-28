import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/signup/signup_request.dart';
import '../../data/model/response/signup/signup_response_model.dart';
import '../repository/signup_repository.dart';

class SignUpUseCase extends UseCase<AuthResponseModel,SignUpRequest> {
  final SignUpRepository signUpRepository;

  SignUpUseCase(this.signUpRepository);

  @override
  Future<Either<dynamic,AuthResponseModel>> call(params) {
    return signUpRepository.signUpUser(params) ;
  }
}

