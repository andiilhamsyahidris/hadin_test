part of 'faculty_bloc.dart';

sealed class FacultyState extends Equatable {
  const FacultyState();

  @override
  List<Object> get props => [];
}

final class FacultyEmpty extends FacultyState {}

final class FacultyLoading extends FacultyState {}

final class FacultyError extends FacultyState {
  final String errorMessage;

  const FacultyError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class FacultyHasData extends FacultyState {
  final List<FacultyEntity> listFaculty;

  const FacultyHasData(this.listFaculty);

  @override
  List<Object> get props => [listFaculty];
}
