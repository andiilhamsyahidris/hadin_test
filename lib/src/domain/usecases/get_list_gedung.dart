import 'package:dartz/dartz.dart';
import 'package:test_hadin/core/utils/failure.dart';
import 'package:test_hadin/src/domain/entities/gedung_faculty_entity.dart';
import 'package:test_hadin/src/domain/repositories/faculty_repositories.dart';

class GetListGedung {
  final FacultyRepositories repositories;

  GetListGedung({required this.repositories});

  Future<Either<Failure, List<GedungFacultyEntity>>> execute(int id) {
    return repositories.getAllGedung(id);
  }
}
