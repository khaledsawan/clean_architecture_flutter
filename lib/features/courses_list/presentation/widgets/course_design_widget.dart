import 'package:flutter/material.dart';

import '../../../../constant/url/app_api_url.dart';
import '../../data/model/course.dart';

class CourseDesignWidget extends StatelessWidget {
  final List<Course> courses;
  CourseDesignWidget({required this.courses});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return VideoCard(course: courses[index]);
      },
    );
  }
}

class VideoCard extends StatelessWidget {
  final Course course;

  VideoCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //   Image.network(AppApiUrl.BASE_URL + course.img!),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  course.name!,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Category: ${course.category}',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Viewers: ${course.viewerQuntity}',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Number of Videos: ${course.numberOfVideos}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
