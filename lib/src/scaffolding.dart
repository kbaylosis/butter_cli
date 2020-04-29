
import 'package:io/io.dart';

import 'paths.dart';

class Scaffolding {
  static void generate(String dest) {
    var src = Paths.getScriptDir();

    copyPath('${src}/../${Paths.libScaffoldingPath}', dest);
    copyPath('${src}/../${Paths.libScaffoldingPath}', dest);
  }
}