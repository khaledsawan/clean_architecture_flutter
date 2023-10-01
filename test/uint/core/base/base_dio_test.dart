import 'package:clean_architecture_flutter/core/base/base_dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_flutter/core/base/base_model.dart';

import 'dart:convert';

class MockCourse {
  String? img;
  String? name;
  int? id;
  String? category;
  int? viewerQuntity;
  int? numberOfVideos;
  int? teacherId;
  String? teacherImage;

  MockCourse({
    this.img,
    this.name,
    this.id,
    this.category,
    this.viewerQuntity,
    this.numberOfVideos,
    this.teacherId,
    this.teacherImage,
  });

  @override
  String toString() {
    return 'Course(img: $img, name: $name, id: $id, category: $category, viewerQuntity: $viewerQuntity, numberOfVideos: $numberOfVideos, teacherId: $teacherId, teacherImage: $teacherImage)';
  }

  factory MockCourse.fromMap(Map<String, dynamic> data) => MockCourse(
        img: data['img'] as String?,
        name: data['name'] as String?,
        id: data['id'] as int?,
        category: data['category'] as String?,
        viewerQuntity: data['viewer_quntity'] as int?,
        numberOfVideos: data['number_of_videos'] as int?,
        teacherId: data['teacher_id'] as int?,
        teacherImage: data['teacherImage'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'img': img,
        'name': name,
        'id': id,
        'category': category,
        'viewer_quntity': viewerQuntity,
        'number_of_videos': numberOfVideos,
        'teacher_id': teacherId,
        'teacherImage': teacherImage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MockCourse].
  factory MockCourse.fromJson(String data) {
    return MockCourse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MockCourse] to a JSON string.
  String toJson() => json.encode(toMap());
}

class MockCoursesResponseModel extends BaseModel<MockCoursesResponseModel> {
  final bool? success;
  final String? message;
  final List<MockCourse>? courses;

  MockCoursesResponseModel({this.success, this.message, this.courses});

  @override
  String toString() {
    return 'Courses(success: $success, message: $message, courses: $courses)';
  }

  @override
  MockCoursesResponseModel fromJson(Map<String, dynamic> json) =>
      MockCoursesResponseModel(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        courses: (json['courses'] as List<dynamic>?)
            ?.map((e) => MockCourse.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
  factory MockCoursesResponseModel.fromJson(Map<String, dynamic> json) {
    return MockCoursesResponseModel.fromJson(json);
  }

  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'courses': courses?.map((e) => e.toMap()).toList(),
      };
}

class MockUserModel extends BaseModel<MockUserModel> {
  // Implement abstract methods and properties for testing
  final String? email;
  final String? password;

  MockUserModel({this.email, this.password});

  @override
  List<Object?> get props => [email, password];

  @override
  MockUserModel fromJson(Map<String, dynamic> json) {
    return MockUserModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

void main() {
  group('TheHttpExecuter Tests', () {
    String getCoursesPath = "/api/indexCoursesStudent";
    String loginUserPath = "/api/login";

    late TheHttpExecuter httpExecuter;

    setUp(() {
      httpExecuter = TheHttpExecuter();
    });

    test('GET Request Test', () async {
      final response = await httpExecuter.get<MockCoursesResponseModel>(
        path: getCoursesPath,
        headers: {},
        queryParameters: {},
        model: MockCoursesResponseModel(),
      );
      expect(response, isNotNull);
      expect(response, isA<MockCoursesResponseModel>());
    });

    test('POST Request Test', () async {
      final response = await httpExecuter.post<MockUserModel>(
        path: loginUserPath,
        headers: {},
        body: {
          'email': 'khaled963sawan1@gmail.com',
          'password': '12345678',
        },
        queryParameters: {
          'param1': 'value1',
        },
        model: MockUserModel(),
      );

      expect(response, isNotNull);
      expect(response, isA<MockUserModel>());
    });
  });
}
