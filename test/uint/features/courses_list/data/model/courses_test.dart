import 'package:clean_architecture_flutter/features/courses_list/data/model/course.dart';
import 'package:clean_architecture_flutter/features/courses_list/data/model/courses.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CoursesResponseModel toJson and fromJson', () {
    // Create a sample CoursesResponseModel object
    final course1 = Course(
      img: 'course_image1.jpg',
      name: 'Course 1',
      id: 1,
      category: 'Programming',
      viewerQuntity: 100,
      numberOfVideos: 10,
      teacherId: 101,
      teacherImage: 'teacher_image1.jpg',
    );

    final course2 = Course(
      img: 'course_image2.jpg',
      name: 'Course 2',
      id: 2,
      category: 'Math',
      viewerQuntity: 50,
      numberOfVideos: 8,
      teacherId: 102,
      teacherImage: 'teacher_image2.jpg',
    );

    final coursesResponse = CoursesResponseModel(
      success: true,
      message: 'Success',
      courses: [course1, course2],
    );

    // Convert the CoursesResponseModel object to JSON
    final jsonCoursesResponse = coursesResponse.toJson();

    // Parse the JSON back to a CoursesResponseModel object
    final parsedCoursesResponse =
        CoursesResponseModel.fromJson(jsonCoursesResponse);

    // Check if the parsed CoursesResponseModel matches the original CoursesResponseModel
    expect(parsedCoursesResponse.toJson(), jsonCoursesResponse,
        reason: 'toJson and fromJson should be inverses.');

    // Check if the parsed CoursesResponseModel's toString matches the original toString
    expect(parsedCoursesResponse.toString(), coursesResponse.toString(),
        reason: 'toString should match the original.');
  });
}
