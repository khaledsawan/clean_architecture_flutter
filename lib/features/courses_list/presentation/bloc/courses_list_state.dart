part of 'courses_list_bloc.dart';

abstract class CoursesListState extends Equatable {
  const CoursesListState();
  @override
  List<Object> get props => [];
}

class CoursesListInitial extends CoursesListState {}

class CoursesListLoading extends CoursesListState {}

class CoursesListFail extends CoursesListState {}

class CoursesListLoaded extends CoursesListState {
  final Courses courses;
  const CoursesListLoaded(this.courses);
}
