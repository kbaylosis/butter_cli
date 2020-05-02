import 'dart:io';

import 'package:butter_cli/src/generator.dart';
import 'package:recase/recase.dart';

import 'template_engine.dart';

class Page extends Generator {
  Page(String name, String destination) : super(name, destination);

  void generate(String pageName) {
    var t = templates;
    t.items['Noname'] = ReCase(pageName).pascalCase;
    final filename = ReCase(pageName).constantCase.toLowerCase();
    t.items['noname'] = filename;

    print('[${t.items['Noname']}Page]');
    TemplateEngine().convert('${srcModulePath}/pages/noname_page.template',
        '${destModulePath}/pages/${filename}_page.dart', t);
    TemplateEngine().convert('${srcModulePath}/states/noname_state.template',
        '${destModulePath}/states/${filename}_state.dart', t);
    TemplateEngine().convert('${srcModulePath}/models/noname_model.template',
        '${destModulePath}/models/${filename}_model.dart', t);
  }
}
