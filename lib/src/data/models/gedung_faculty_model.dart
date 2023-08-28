import 'package:equatable/equatable.dart';
import 'package:test_hadin/src/domain/entities/gedung_faculty_entity.dart';

class GedungFacultyModel extends Equatable {
  final int id;
  final int? idUser;
  final int? idFakultas;
  final String? namaGedung;
  final String? namaSingkat;

  const GedungFacultyModel({
    required this.id,
    this.idUser,
    this.idFakultas,
    this.namaGedung,
    this.namaSingkat,
  });

  factory GedungFacultyModel.fromJson(Map<String, dynamic> json) =>
      GedungFacultyModel(
        id: json['id'],
        idUser: json['id_user'],
        idFakultas: json['id_fakultas'],
        namaGedung: json['nama_gedung'],
        namaSingkat: json['slug'],
      );

  factory GedungFacultyModel.fromEntity(GedungFacultyEntity faculty) =>
      GedungFacultyModel(
        id: faculty.id,
        idUser: faculty.idUser,
        idFakultas: faculty.idFakultas,
        namaGedung: faculty.namaGedung,
        namaSingkat: faculty.namaSingkat,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_user': idUser,
        'id_fakultas': idFakultas,
        'nama_gedung': namaGedung,
        'slug': namaSingkat,
      };

  GedungFacultyEntity toEntity() {
    return GedungFacultyEntity(
      id: id,
      idUser: idUser,
      idFakultas: idFakultas,
      namaGedung: namaGedung,
      namaSingkat: namaSingkat,
    );
  }

  @override
  List<Object?> get props => [
        id,
        idUser,
        idFakultas,
        namaGedung,
        namaSingkat,
      ];
}
