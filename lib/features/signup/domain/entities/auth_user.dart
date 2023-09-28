import 'package:equatable/equatable.dart';

class AuthUser extends Equatable{
 final String? token;
final  String? role;

  AuthUser({
    this.token,
    this.role,
  });
  
  @override
  
  List<Object?> get props => [token,role];
}
