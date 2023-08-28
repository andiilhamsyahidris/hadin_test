import 'package:flutter/material.dart';
import 'package:test_hadin/hadin.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const Hadin());
}
