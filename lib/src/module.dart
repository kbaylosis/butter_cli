import 'package:butter_cli/src/generator.dart';
import 'package:recase/recase.dart';

import 'action.dart';
import 'page.dart';
import 'template_engine.dart';

class Module extends Generator {
  Module(String name, String destination) : super(name, destination);

  void generate() {
    print('[Main ${ReCase(name).titleCase} file]');
    TemplateEngine().convert('${srcModulePath}/noname.template',
        '${destModulePath}/${name}.dart', templates);

    Action(name, destination).generate('sample');
    Page(name, destination).generate(name);
  }
}
