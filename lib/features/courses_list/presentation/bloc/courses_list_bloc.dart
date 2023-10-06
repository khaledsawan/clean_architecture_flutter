import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/courses.dart';
import '../../domain/use_case/Coursese_use_case.dart';

part 'courses_list_event.dart';
part 'courses_list_state.dart';

class CoursesListBloc extends Bloc<CoursesListEvent, CoursesListState> {
  final CoursesUseCase coursesService ;

  CoursesListBloc(this.coursesService) : super(CoursesListInitial()) {
    on<CoursesListEvent>(_onCoursesFetched);
  }

  Future<void> _onCoursesFetched(
      CoursesListEvent event, Emitter<CoursesListState> emit) async {
    if (event is GetCoursesList) {
      emit(CoursesListLoading());
      final posts = await coursesService.call(NoParams());
      posts.fold((l) => emit(CoursesListFail()), (r) => emit(CoursesListLoaded(r)));
    }
  }
}
