class AuthResponseModel {
  String? token;
  String? role;

  AuthResponseModel({
    this.token,
    this.role,
  });
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(role: json['role'], token: json['token']);
  }

  AuthResponseModel fromJson(Map<String, dynamic> json) {
    return AuthResponseModel.fromJson(json);
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
