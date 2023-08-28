import 'package:dartz/dartz.dart';
import 'package:test_hadin/core/utils/failure.dart';
import 'package:test_hadin/src/domain/entities/faculty_entity.dart';
import 'package:test_hadin/src/domain/repositories/faculty_repositories.dart';

class GetListFaculty {
  final FacultyRepositories repositories;

  GetListFaculty({required this.repositories});

  Future<Either<Failure, List<FacultyEntity>>> execute() {
    return repositories.getAllUsers();
  }
}
