import 'package:clean_architecture_flutter/features/courses_list/data/model/course.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Course course = Course(
    img: 'course_image.jpg',
    name: 'Introduction to Dart Programming',
    id: 1,
    category: 'Programming',
    viewerQuntity: 100,
    numberOfVideos: 10,
    teacherId: 101,
    teacherImage: 'teacher_image.jpg',
  );

  test('Course toJson and fromJson', () {
    // Convert the course object to JSON
    String jsonCourse = course.toJson();

    // Parse the JSON back to a Course object
    Course parsedCourse = Course.fromJson(jsonCourse);

    // Check if the parsed Course matches the original Course
    expect(parsedCourse.toJson(), course.toJson(),
        reason: 'toJson and fromJson should be inverses.');

    // Check if the parsed Course's Map representation matches the original Course's Map
    expect(parsedCourse.toMap(), course.toMap(),
        reason: 'toMap should match the original.');

    // Check if the parsed Course's toString matches the original Course's toString
    expect(parsedCourse.toString(), course.toString(),
        reason: 'toString should match the original.');
  });
}
