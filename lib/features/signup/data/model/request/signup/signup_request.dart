
import 'dart:io';

import '../../../../../../core/base/base_model.dart';

class SignUpRequest extends BaseModel<SignUpRequest> {
  final String? email;
  final String? password;
  final File? image;

  SignUpRequest({this.email, this.password,this.image});

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        email: json["email"],
        password: json["password"],
        image: json["image"],
      );

  @override
  SignUpRequest fromJson(Map<String, dynamic> json) =>
      SignUpRequest.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    return data;
  }

  @override
  List<Object?> get props => [email, password,image];
}
