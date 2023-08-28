import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_hadin/src/domain/entities/gedung_faculty_entity.dart';
import 'package:test_hadin/src/domain/usecases/get_list_gedung.dart';

part 'gedung_event.dart';
part 'gedung_state.dart';

class GedungBloc extends Bloc<GedungEvent, GedungState> {
  final GetListGedung getListGedung;

  GedungBloc({required this.getListGedung}) : super(GedungEmpty()) {
    on<FetchGedung>((event, emit) async {
      emit(GedungLoading());

      final id = event.id;

      final result = await getListGedung.execute(id);
      result.fold(
        (failure) {
          emit(GedungError(failure.message));
        },
        (data) {
          emit(
            GedungHasData(data),
          );
        },
      );
    });
  }
}
