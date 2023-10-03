import '../../../../core/base/base_model.dart';
import 'course.dart';

class CoursesResponseModel extends BaseModel {
  final bool? success;
  final String? message;
  final List<Course>? courses;

  CoursesResponseModel({this.success, this.message, this.courses});

  @override
  String toString() {
    return 'Courses(success: $success, message: $message, courses: $courses)';
  }

  @override
  CoursesResponseModel fromJson(Map<String, dynamic> json) =>
      CoursesResponseModel(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        courses: (json['courses'] as List<dynamic>?)
            ?.map((e) => Course.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
  factory CoursesResponseModel.fromJson(Map<String, dynamic> json) {
    return CoursesResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
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
