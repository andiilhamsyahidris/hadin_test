import 'package:flutter/material.dart';
import 'package:test_hadin/core/constant/text_const.dart';
import 'package:test_hadin/src/domain/entities/gedung_faculty_entity.dart';

class TileGedung extends StatelessWidget {
  final GedungFacultyEntity gedungEntity;
  const TileGedung({super.key, required this.gedungEntity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        gedungEntity.namaGedung ?? '',
        style: kTextTheme.headlineSmall,
      ),
      subtitle: Text(
        gedungEntity.namaSingkat ?? '',
        style: kTextTheme.bodyLarge,
      ),
    );
  }
}
