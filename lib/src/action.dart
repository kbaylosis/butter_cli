import 'package:recase/recase.dart';

import 'generator.dart';
import 'paths.dart';
import 'template_engine.dart';

class Action extends Generator {
  Action(String name, String destination) : super(name, destination);

  void generate(String actionName) {
    var src = Paths.getPubCacheDir();
    var t = templates;
    t.items['Sample'] = ReCase(actionName).pascalCase;
    final filename = ReCase(actionName).constantCase.toLowerCase();

    print('[${t.items['Sample']}Action]');
    TemplateEngine().convert(
        '${src}/${srcModulePath}/actions/sample_action.template',
        '${destModulePath}/actions/${filename}_action.dart',
        t);
  }
}
