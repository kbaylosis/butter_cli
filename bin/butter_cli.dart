import 'dart:io';

import 'package:args/args.dart';

import 'package:butter_cli/butter_cli.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  final parser = ArgParser();
  parser.addOption('destination', abbr: 'd');
  parser.addFlag('help', abbr: 'h');
  parser.addOption('module', abbr: 'm');
  parser.addOption('name', abbr: 'n');
  parser.addFlag('skeleton', abbr: 's');
  parser.addOption('type', abbr: 't');

  var results = parser.parse(arguments);
  String dest = results['destination'] ?? '.';

  print('Butter CLI v${version}');
  
  if (results['help']) {
    showHelp();
    return;
  }

  if (results['skeleton']) {
    print('This will generate skelatal files of the butter framework in:');
    print(dest);
    print('');
    stdout.write('Do you want to proceed? <y/n> ');
    var confirm = stdin.readLineSync();
    if (confirm.trim().toLowerCase() == 'y') {
      Scaffolding(dest).generate();
    } else {
      print('');
      print('---Generated nothing---');
      return;
    }
  } else {
    String type = results['type'];
    String module = results['module'];
    String name = results['name'];
    var article = type == 'action' ? 'an' : 'a';
    
    print('This will generate ${article} ${type} in your butter project in:');
    print(dest);
    stdout.write('Do you want to proceed? <y/n> ');
    var confirm = stdin.readLineSync();
    if (confirm.trim().toLowerCase() == 'n') {
      print('');
      print('---Generated nothing---');
      return;
    }

    switch(type) {
    case 'module':
      Module(module, dest).generate();
      break;
    case 'page':
      Page(module, dest).generate(name);
      break; 
    case 'action':
      Action(module, dest).generate(name);
      break;
    default:
      print('');
      print('---Generated nothing---');
      return;
    }
  }

  showLogo();
  print('');
  print('Success! Happy coding! •ᴗ•');
  print('');
}

void showLogo() {
  print('');
  print('.+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++`');
  print('.sss+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++sss. ');
  print('.ss+                                                                                     +ss. ');
  print('.ss+   `ossssssso+-`   `+ssso` `+sssssssssssssssssssssss/:sssssssssss:  -ossssssso/-     +ss. ');
  print('.ss+   `oyyyssssyys+.  `+yyys. `+syyyssssyyyyssssyyyysss//syyssssyyyy:  -syyyssssyss/`   +ss. ');
  print('.ss+   `oyyys-.:syys+` `+yyys. `+syys:..+syys:..+syys/..:syys/../syyy:  -syyy+../syys:   +ss. ');
  print('.ss+   `oyyyo. `oyyyo` `+yyys. `+syys.  /syys-  /syys-  :syys:  -syyy:  -syys+  .syys+   +ss. ');
  print('.ss+   `oyyyo. `oyyyo` `+yyys. `+syys.  /syys-  /syys-  :syys:  -syyy:  -syys+  .syys+   +ss. ');
  print('.ss+   `oyyyo. `oyyyo` `+yyys. `+syys.  /syys-  /syys-  :syys:  -ssss:  -syys+  .syys+   +ss. ');
  print('.ss+   `oyyyo. `oyyyo` `+yyys. `+syys.  /syys-  /syys-  :syys:   `````  -syys+  -syys+   +ss. ');
  print('.ss+   `oyyys:-:syys+` `+yyys. `+syys.  /syys-  /syys-  :syyy/-......`  -syyyo--+syys:   +ss. ');
  print('.ss+   `oyyyyyyyyyyo.  `+yyys. `+syys.  /syys-  /syys-  :syyyyyyyyyys:  -syyyyyyyyys+`   +ss. ');
  print('.ss+   `oyyyssssyyys:  `+yyys. `+syys.  /syys-  /syys-  :syyyssssssss:  -syyyssssyyso.   +ss. ');
  print('.ss+   `oyyyo.`.syyyo` `+yyys. `+syys.  /syys-  /syys-  :syyy/```````   -syyy/``:syys/   +ss. ');
  print('.ss+   `oyyyo. `oyyyo` `+yyys. `+syys.  /syys-  /syys-  :syyy/  `----.  -syys/  .syys+   +ss. ');
  print('.ss+   `oyyyo. `oyyyo` `+yyys. `+syys.  /syys-  /syys-  :syyy/  -ssss:  -syys/  .syys+   +ss. ');
  print('.ss+   `oyyyo. `oyyyo` `+yyys. `+syys.  /syys-  /syys-  :syyy:  -syyy:  -syys/  .syys+   +ss. ');
  print('.ss+   `oyyyo. `oyyyo` `+yyys. `+syys.  /syys-  /syys-  :syyy:  -syyy:  -syys/  .syys+   +ss. ');
  print('.ss+   `oyyys/:+syys/   /syys/-:syyyo`  /syys-  /syys-  :syyy+::+syyy:  -syys/  .syys+   +ss. ');
  print('.ss+   `oyyyyyyyyss/`   `/ssyyssyyso.   /syys-  /syys-  :syyyyyyyyyyy:  -syys/  .syys+   +ss. ');
  print('.ss+   `+oooooo+/:.       ./oosso+:`    :+oo+.  :+oo+.  -oooooooooooo-  .+ooo:  .+ooo:   +ss. ');
  print('.ss+                                                                                     +ss. ');
  print('.sys+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++sys. ');
  print('.+ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+`');
  print('');
}

void showHelp() {
  print('Usage: butter_cli [<options>] --destination <destination>');
  print('');
  print('Generates the butter framework scaffolding.');
  print('');
  print('Options:');
  print('--help or -h');
  print('  Show this information');
  print('  When generating a page. A state and model is provided along with it.');
  print('--module or -m');
  print('  The name of the module. Use a lowercase_with_underscores.');
  print('--name or -n');
  print('  The name of the object under a module. Specify this when generating');
  print('  a page or an action. Use a lowercase_with_underscores.');
  print('--skeleton or -s');
  print('  Generates the skeletal files of the framework under lib and test');
  print('--type=<item> or -t');
  print('  Where item is any of: module, page, action.');
  print('');
  print('To generate a project skeleton: ');
  print(' butter_cli -s -d /path/to/project');
  print('');
  print('To generate a module: ');
  print(' butter_cli -t module -m home -d /path/to/project');
  print('');
  print('To generate a page: ');
  print(' butter_cli -t page -m profile -n edit_profile -d /path/to/project'); 
  print('');
}