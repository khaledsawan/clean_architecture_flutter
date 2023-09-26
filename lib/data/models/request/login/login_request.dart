import '../../../../core/base/base_model.dart';

class LoginRequest extends BaseModel<LoginRequest> {
  final String? email;
  final String? password;

  LoginRequest({this.email, this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json["email"],
        password: json["password"],
      );

  @override
  LoginRequest fromJson(Map<String, dynamic> json) =>
      LoginRequest.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  @override
  List<Object?> get props => [email, password];
}
