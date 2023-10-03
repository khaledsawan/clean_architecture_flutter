import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/courses_list_bloc.dart';
import '../widgets/course_design_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final postListBloc = CoursesListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await SharedPreferences.getInstance()
            .then((value) => value.clear()),
        child: Icon(Icons.logout),
      ),
      body: BlocProvider<CoursesListBloc>(
        create: (BuildContext context) => postListBloc,
        child: BlocBuilder(
          bloc: postListBloc,
          builder: (BuildContext context, CoursesListState state) {
            if (state is CoursesListInitial) {
              context.watch<CoursesListBloc>().add(const GetCoursesList());
              return const Center(child: Text("init"));
            } else if (state is CoursesListLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is CoursesListLoaded) {
              return CourseDesignWidget(courses: state.courses.courses!);
            } else if (state is CoursesListFail) {
              return const Center(child: Text("fail"));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
