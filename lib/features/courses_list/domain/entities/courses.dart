import '../../../../core/base/base_model.dart';
import '../../data/model/course.dart';

class Courses extends BaseModel {
  final bool? success;
  final String? message;
  final List<Course>? courses;

  Courses({this.success, this.message, this.courses});

  @override
  String toString() {
    return 'Courses(success: $success, message: $message, courses: $courses)';
  }

  @override
  Courses fromJson(Map<String, dynamic> json) =>
      Courses(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        courses: (json['courses'] as List<dynamic>?)
            ?.map((e) => Course.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
  factory Courses.fromJson(Map<String, dynamic> json) {
    return Courses.fromJson(json);
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
