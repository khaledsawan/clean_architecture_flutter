import 'dart:convert';

class Course {
  String? img;
  String? name;
  int? id;
  String? category;
  int? viewerQuntity;
  int? numberOfVideos;
  int? teacherId;
  String? teacherImage;

  Course({
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

  factory Course.fromMap(Map<String, dynamic> data) => Course(
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
  /// Parses the string and returns the resulting Json object as [Course].
  factory Course.fromJson(String data) {
    return Course.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Course] to a JSON string.
  String toJson() => json.encode(toMap());
}
