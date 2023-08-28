import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_hadin/core/utils/api_service.dart';
import 'package:test_hadin/core/utils/exception.dart';
import 'package:test_hadin/src/data/models/faculty_model.dart';
import 'package:test_hadin/src/data/models/faculty_response.dart';
import 'package:test_hadin/src/data/models/gedung_faculty_model.dart';
import 'package:test_hadin/src/data/models/gedung_faculty_response.dart';

abstract class FacultyDatasource {
  Future<List<FacultyModel>> getListFaculty();
  Future<List<GedungFacultyModel>> getGedungFaculty(final int id);
}

class ImplFacultyDatasource implements FacultyDatasource {
  final http.Client client;

  ImplFacultyDatasource({
    required this.client,
  });

  @override
  Future<List<FacultyModel>> getListFaculty() async {
    final response = await client.get(
      Uri.parse('${ApiService.baseUrl}fakultas'),
    );
    if (response.statusCode == 200) {
      return FacultyResponse.fromJson(json.decode(response.body)).facultyList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<GedungFacultyModel>> getGedungFaculty(final int id) async {
    final response = await client.get(
      Uri.parse('${ApiService.baseUrl}gedungs/$id'),
    );
    if (response.statusCode == 200) {
      return GedungFacultyResponse.fromJson(json.decode(response.body))
          .listGedung;
    } else {
      throw ServerException();
    }
  }
}
