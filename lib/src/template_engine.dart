import 'dart:io';

import 'package:mustache/mustache.dart';

import 'templates.dart';

class TemplateEngine {
  void convert(String src, String dest, Templates templates) {
    var sourceData = File(src).readAsStringSync();
    var template = Template(sourceData);

    var output = template.renderString(templates.items);

    var destFile = File(dest);
    if (destFile.existsSync()) {
      throw FileSystemException('Destination file already exists!');
    }

    destFile.createSync(recursive: true);
    destFile.writeAsStringSync(output);
  }
}
