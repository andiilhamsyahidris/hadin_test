part of 'gedung_bloc.dart';

abstract class GedungEvent {
  const GedungEvent();
}

class FetchGedung extends GedungEvent {
  final int id;

  const FetchGedung({required this.id});
}
