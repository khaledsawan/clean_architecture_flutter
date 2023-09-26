class LoginResponseModel {
  String? token;
  String? role;

  LoginResponseModel({
    this.token,
    this.role,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(role: json['role'], token: json['token']);
  }

  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return LoginResponseModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['role'] = role;
    return data;
  }
}

String convertToJson(String input) {
  // {"name": public", "nickname": private", "bio": public", "email": private", "gender": public", "birth": public", "address": private", "country": private", "city": private", "job": private", "language": private", "nationality": private"}
  String output = input
      .replaceAll("{", '{"')
      .replaceAll("}", '"}')
      .replaceAll(":", '":"')
      .replaceAll(", ", '","');
  return output;
}
