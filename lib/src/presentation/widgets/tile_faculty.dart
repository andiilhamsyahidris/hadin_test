import 'package:flutter/material.dart';
import 'package:test_hadin/core/constant/text_const.dart';
import 'package:test_hadin/src/domain/entities/faculty_entity.dart';

class TileFaculty extends StatelessWidget {
  final FacultyEntity facultyEntity;
  const TileFaculty({super.key, required this.facultyEntity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        facultyEntity.namaResmi ?? '',
        style: kTextTheme.headlineSmall,
      ),
      subtitle: Text(
        facultyEntity.namaSingkat ?? '',
        style: kTextTheme.bodyLarge,
      ),
    );
  }
}
