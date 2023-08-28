import 'package:equatable/equatable.dart';
import 'package:test_hadin/src/domain/entities/faculty_entity.dart';

class FacultyModel extends Equatable {
  final int id;
  final int idUser;
  final int idFakultas;
  final String? namaResmi;
  final String? namaSingkat;
  final String? namaAsing;
  final String? namaAsingSingkat;

  const FacultyModel({
    required this.id,
    required this.idUser,
    required this.idFakultas,
    this.namaResmi,
    this.namaSingkat,
    this.namaAsing,
    this.namaAsingSingkat,
  });

  factory FacultyModel.fromJson(Map<String, dynamic> json) => FacultyModel(
        id: json['id'],
        idUser: json['id_user'],
        idFakultas: json['id_fakultas'],
        namaResmi: json['nama_resmi'],
        namaSingkat: json['nama_singkat'],
        namaAsing: json['nama_asing'],
        namaAsingSingkat: json['nama_asing_singkat'],
      );

  factory FacultyModel.fromEntity(FacultyEntity faculty) => FacultyModel(
        id: faculty.id,
        idUser: faculty.idUser,
        idFakultas: faculty.idFakultas,
        namaResmi: faculty.namaResmi,
        namaSingkat: faculty.namaSingkat,
        namaAsing: faculty.namaAsing,
        namaAsingSingkat: faculty.namaAsingSingkat,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_user': idUser,
        'id_fakultas': idFakultas,
        'nama_resmi': namaResmi,
        'nama_singkat': namaSingkat,
        'nama_asing': namaAsing,
        'nama_asing_singkat': namaAsingSingkat,
      };

  FacultyEntity toEntity() {
    return FacultyEntity(
      id: id,
      idUser: idUser,
      idFakultas: idFakultas,
      namaResmi: namaResmi,
      namaSingkat: namaSingkat,
      namaAsing: namaAsing,
      namaAsingSingkat: namaAsingSingkat,
    );
  }

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
