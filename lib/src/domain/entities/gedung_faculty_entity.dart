import 'package:equatable/equatable.dart';

class GedungFacultyEntity extends Equatable {
  final int id;
  final int? idUser;
  final int? idFakultas;
  final String? namaGedung;
  final String? namaSingkat;
  final String? namaAsing;
  final String? namaAsingSingkat;

  const GedungFacultyEntity({
    required this.id,
    this.idUser,
    this.idFakultas,
    this.namaGedung,
    this.namaSingkat,
    this.namaAsing,
    this.namaAsingSingkat,
  });

  @override
  List<Object?> get props => [
        id,
        idUser,
        idFakultas,
        namaGedung,
        namaSingkat,
        namaAsing,
        namaAsingSingkat,
      ];
}
