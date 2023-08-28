import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:test_hadin/core/utils/exception.dart';
import 'package:test_hadin/core/utils/failure.dart';
import 'package:test_hadin/src/data/datasources/faculty_datasource.dart';
import 'package:test_hadin/src/domain/entities/faculty_entity.dart';
import 'package:test_hadin/src/domain/entities/gedung_faculty_entity.dart';
import 'package:test_hadin/src/domain/repositories/faculty_repositories.dart';

class FacultyRepositoryImpl implements FacultyRepositories {
  final FacultyDatasource facultyDatasource;

  FacultyRepositoryImpl({required this.facultyDatasource});

  @override
  Future<Either<Failure, List<FacultyEntity>>> getAllUsers() async {
    try {
      final result = await facultyDatasource.getListFaculty();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<GedungFacultyEntity>>> getAllGedung(
      int id) async {
    try {
      final result = await facultyDatasource.getGedungFaculty(id);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
