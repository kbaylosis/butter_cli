
import 'dart:io';

import 'package:butter_cli/src/generator.dart';

import 'action.dart';
import 'page.dart';
import 'template_engine.dart';

class Module extends Generator {

  Module(String name, String destination) : super(name, destination);

  void generate() {
    stdout.write('Generating main module file... ');
    TemplateEngine().convert('${srcModulePath}/noname.dart', 
      '${destModulePath}/${name}.dart', templates);
    print('✓ Done');

    Action(name, destination).generate('sample');
    Page(name, destination).generate(name);
  }
}
