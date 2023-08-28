import 'package:equatable/equatable.dart';

class FacultyEntity extends Equatable {
  final int id;
  final int idUser;
  final int idFakultas;
  final String? namaResmi;
  final String? namaSingkat;
  final String? namaAsing;
  final String? namaAsingSingkat;

  const FacultyEntity({
    required this.id,
    required this.idUser,
    required this.idFakultas,
    this.namaResmi,
    this.namaSingkat,
    this.namaAsing,
    this.namaAsingSingkat,
  });

  @override
  List<Object?> get props => [
        id,
        idUser,
        idFakultas,
        namaResmi,
        namaSingkat,
        namaAsing,
        namaAsingSingkat,
      ];
}
