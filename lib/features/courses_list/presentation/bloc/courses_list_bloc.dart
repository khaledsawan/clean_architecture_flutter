import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/response/courses/courses.dart';
import '../../../../di.dart';
import '../../../../services/Coursese_service.dart';

part 'courses_list_event.dart';
part 'courses_list_state.dart';

class CoursesListBloc extends Bloc<CoursesListEvent, CoursesListState> {
  final coursesService = CoursesService(getIt());

  CoursesListBloc() : super(CoursesListInitial()) {
    on<CoursesListEvent>(_onCoursesFetched);
  }

  Future<void> _onCoursesFetched(
      CoursesListEvent event, Emitter<CoursesListState> emit) async {
    if (event is GetCoursesList) {
      emit(CoursesListLoading());
      final posts = await coursesService.getCourses();
      posts.fold(
          (l) => emit(CoursesListFail()), (r) => emit(CoursesListLoaded(r)));
    }
  }
}
