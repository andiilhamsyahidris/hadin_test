import 'package:equatable/equatable.dart';
import 'package:test_hadin/src/data/models/faculty_model.dart';

class FacultyResponse extends Equatable {
  final List<FacultyModel> facultyList;

  const FacultyResponse({required this.facultyList});

  factory FacultyResponse.fromJson(List<dynamic> json) => FacultyResponse(
        facultyList: List<FacultyModel>.from(
            (json).map((e) => FacultyModel.fromJson(e)).toList()),
      );

  @override
  List<Object> get props => [facultyList];
}
