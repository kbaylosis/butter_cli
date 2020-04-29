import 'dart:io';

import 'package:path/path.dart';

class Paths {
  static const String libScaffoldingPath = 'scaffolding/lib';
  static const String testScaffoldingPath = 'scaffolding/test';
  static const String moduleScaffoldingPath = 'scaffolding/noname';

  static const String libPath = 'lib';
  static const String testPath = 'test';

  static String getCurrentDir() {
    return Directory.current.toString();
  }

  static String getScriptDir() {
    return dirname(Platform.script.toString()).replaceFirst('file://', '');
  }
}