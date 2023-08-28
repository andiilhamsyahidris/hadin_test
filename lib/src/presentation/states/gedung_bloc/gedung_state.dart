part of 'gedung_bloc.dart';

sealed class GedungState extends Equatable {
  const GedungState();

  @override
  List<Object> get props => [];
}

final class GedungEmpty extends GedungState {}

final class GedungLoading extends GedungState {}

final class GedungError extends GedungState {
  final String errorMessage;

  const GedungError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class GedungHasData extends GedungState {
  final List<GedungFacultyEntity> listGedung;

  const GedungHasData(this.listGedung);

  @override
  List<Object> get props => [listGedung];
}
