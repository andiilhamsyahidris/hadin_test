import 'package:equatable/equatable.dart';
import 'package:test_hadin/src/data/models/gedung_faculty_model.dart';

class GedungFacultyResponse extends Equatable {
  final List<GedungFacultyModel> listGedung;

  const GedungFacultyResponse({required this.listGedung});

  factory GedungFacultyResponse.fromJson(List<dynamic> json) =>
      GedungFacultyResponse(
        listGedung: List<GedungFacultyModel>.from(
            (json).map((e) => GedungFacultyModel.fromJson(e)).toList()),
      );

  @override
  List<Object> get props => [listGedung];
}
