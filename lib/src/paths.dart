import 'dart:io';

import 'package:path/path.dart';
import 'package:pub_cache/pub_cache.dart';

import 'config.dart';

class Paths {
  static const String libScaffoldingPath = 'bin/templates/lib';
  static const String testScaffoldingPath = 'bin/templates/test';
  static const String moduleScaffoldingPath = 'bin/templates/noname';

  static const String libPath = 'lib';
  static const String modulePath = 'lib/modules';
  static const String testPath = 'test';

  static String getCurrentDir() {
    return Directory.current.toString();
  }

  static String getScriptDir() =>
      dirname(Platform.script.toString()).replaceFirst('file://', '');

  static String getPubCacheDir() =>
      '${PubCache().location.uri.path}/hosted/pub.dartlang.org/butter_cli-${Config.version}'
          .replaceAll("'", '');
}
