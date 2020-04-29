import 'dart:io';

import 'package:io/io.dart';

import 'paths.dart';

class Scaffolding {
  final String destination;

  Scaffolding(this.destination);

  void generate() {
    var src = Paths.getScriptDir();

    stdout.write('Generating project skeleton... ');
    copyPath('${src}/../${Paths.libScaffoldingPath}',
        '${destination}/${Paths.libPath}');
    copyPath('${src}/../${Paths.testScaffoldingPath}',
        '${destination}/${Paths.testPath}');
    print('✓ Done');
  }
}
