import 'package:dartz/dartz.dart';
import 'package:test_hadin/core/utils/failure.dart';
import 'package:test_hadin/src/domain/entities/faculty_entity.dart';
import 'package:test_hadin/src/domain/entities/gedung_faculty_entity.dart';

abstract class FacultyRepositories {
  Future<Either<Failure, List<FacultyEntity>>> getAllUsers();
  Future<Either<Failure, List<GedungFacultyEntity>>> getAllGedung(int id);
}
