import 'dart:io';

import 'package:butter_cli/src/config.dart';
import 'package:io/io.dart';

import 'paths.dart';
import 'template_engine.dart';

class Scaffolding {
  final String destination;

  Scaffolding(this.destination);

  void generate() {
    var src = Paths.getPubCacheDir();
    var engine = TemplateEngine();

    print('Generating project skeleton... ');

    // lib
    engine.copy('${src}/${Paths.libScaffoldingPath}/main.template',
        '${destination}/${Paths.libPath}/main.dart');

    // lib/app
    engine.copy('${src}/${Paths.libScaffoldingPath}/app/app.template',
        '${destination}/${Paths.libPath}/app/app.dart');
    engine.copy('${src}/${Paths.libScaffoldingPath}/app/routes.template',
        '${destination}/${Paths.libPath}/app/routes.dart');
    engine.copy('${src}/${Paths.libScaffoldingPath}/app/theme.template',
        '${destination}/${Paths.libPath}/app/theme.dart');

    // lib/config
    engine.copy('${src}/${Paths.libScaffoldingPath}/config/app_config.template',
        '${destination}/${Paths.libPath}/config/app_config.dart');

    // lib/data
    print('${destination}/${Paths.libPath}/data');
    copyPath('${src}/${Paths.libScaffoldingPath}/data',
        '${destination}/${Paths.libPath}/data');

    // lib/modules
    print('${destination}/${Paths.libPath}/modules');
    copyPath('${src}/${Paths.libScaffoldingPath}/modules',
        '${destination}/${Paths.libPath}/modules');

    // lib/services
    print('${destination}/${Paths.libPath}/services');
    copyPath('${src}/${Paths.libScaffoldingPath}/services',
        '${destination}/${Paths.libPath}/services');

    // lib/utils
    engine.copy(
        '${src}/${Paths.libScaffoldingPath}/utils/sub_module_page_specs.template',
        '${destination}/${Paths.libPath}/utils/sub_module_page_specs.dart');

    // test
    print('${destination}/${Paths.testPath}');
    engine.copy(
        '${src}/${Paths.testScaffoldingPath}/widget_test.template',
        '${destination}/${Paths.testPath}/widget_test.dart');

    // pubspec.yaml
    print('${destination}/pubspec.yaml');
    updatePubspec(destination);

    print('✓ Done');
  }

  void updatePubspec(String destination) {
    var srcFile = File('$destination/pubspec.yaml');
    var sourceData = srcFile.readAsStringSync();

    if (sourceData.contains('butter:')) {
      return;
    }
    
    sourceData = sourceData.replaceFirst('sdk: flutter', 'sdk: flutter\n  butter:');

    srcFile.writeAsStringSync(sourceData);
  }
}
