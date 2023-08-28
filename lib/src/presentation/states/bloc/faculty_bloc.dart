import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_hadin/src/domain/entities/faculty_entity.dart';
import 'package:test_hadin/src/domain/usecases/get_list_faculty.dart';

part 'faculty_event.dart';
part 'faculty_state.dart';

class FacultyBloc extends Bloc<FacultyEvent, FacultyState> {
  final GetListFaculty getListFaculty;
  FacultyBloc({required this.getListFaculty}) : super(FacultyEmpty()) {
    on<FetchFaculty>((event, emit) async {
      emit(FacultyLoading());

      final result = await getListFaculty.execute();
      result.fold(
        (failure) {
          emit(FacultyError(failure.message));
        },
        (data) {
          emit(
            FacultyHasData(data),
          );
        },
      );
    });
  }
}
