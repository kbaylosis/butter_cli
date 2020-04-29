import 'dart:io';

import 'package:path/path.dart';

class Paths {
  static const String libScaffoldingPath = 'assets/lib';
  static const String testScaffoldingPath = 'assets/test';
  static const String moduleScaffoldingPath = 'assets/noname';

  static const String libPath = 'lib';
  static const String modulePath = 'lib/modules';
  static const String testPath = 'test';

  static String getCurrentDir() {
    return Directory.current.toString();
  }

  static String getScriptDir() {
    return dirname(Platform.script.toString()).replaceFirst('file://', '');
  }
}
