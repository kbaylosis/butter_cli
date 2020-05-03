import 'dart:io';

import 'package:args/args.dart';

import 'package:butter_cli/butter_cli.dart';

enum ExitCode {
  SUCCESS,
  WARNING,
  ERROR,
}

ExitCode main(List<String> arguments) {
  try {
    final parser = ArgParser();
    parser.addOption('destination', abbr: 'd');
    parser.addFlag('help', abbr: 'h');
    parser.addOption('module', abbr: 'm');
    parser.addOption('name', abbr: 'n');
    parser.addFlag('skeleton', abbr: 's');
    parser.addOption('type', abbr: 't');

    var results = parser.parse(arguments);
    String dest = results['destination'] ?? '.';

    print('Butter CLI v${Config.version}');

    if (results['help']) {
      showHelp();
      return ExitCode.SUCCESS;
    }

    if (results['skeleton']) {
      print('This will generate skelatal files of the butter framework in:');
      print(dest);
      print('');
      do {
        stdout.write('Do you want to proceed? <y/n> ');
        var confirm = stdin.readLineSync();
        if (confirm.trim().toLowerCase() == 'y') {
          Scaffolding(dest).generate();
          break;
        } else if (confirm.trim().toLowerCase() == 'n') {
          print('');
          print('---Generated nothing---');
          return ExitCode.WARNING;
        }
      } while (true);
    } else {
      String type = results['type'];
      String module = results['module'];
      String name = results['name'];
      var article = type == 'action' ? 'an' : 'a';

      if (type == null) {
        showHelp();
        return ExitCode.WARNING;
      }

      print('This will generate ${article} ${type} in your butter project in:');
      print(dest);
      print('');
      do {
        stdout.write('Do you want to proceed? <y/n> ');
        var confirm = stdin.readLineSync();
        if (confirm.trim().toLowerCase() == 'y') {
          break;
        } else if (confirm.trim().toLowerCase() == 'n') {
          print('');
          print('---Generated nothing---');
          return ExitCode.WARNING;
        }
      } while (true);

      switch (type) {
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
          return ExitCode.ERROR;
      }
    }

    showLogo();
    print('');
    print('Success! Happy coding! •ᴗ•');
    print('');

    return ExitCode.SUCCESS;
  } catch (e) {
    print('');
    print('Something went wrong... (╥_╥)');
    print('');
    print(e);
    return ExitCode.ERROR;
  }
}

void showLogo() {
  print('');
  print(
      './:::::::.   .+::: ./::: `/::::::::/  -+::::::::- ./::::::::/  -+:::::::-`');
  print(
      '+y-./+/:./.  ss..+ ss..+ +s+++-.:+// .ys++:.-++/. oy-./++++// `so.-++++--+');
  print(
      '+y-.+++/.::  ss..+ so..+ `..+s:.o-.   ..:so.:/.`  oy-.++++++` .so.-+/os-.+');
  print(
      '+s-.:///:-+` ss..+ yo..+    +s:.o       .so.::    oy-.:::::+` .so..::---/-');
  print(
      '+y-.++oo/./. ss-.+-o+.-/    +s:.o       .s+.::    oy-.+oooo:- .so.-ooo--+ ');
  print(
      '+s:::::::::  +s+/::::::`    +s/:o       .so:/-    oy::::::::+ .so:/:+s+://');
  print(
      ':///////-`   `-/////:`      -//:`       `///.     :////////:` `///- `///:`');
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
  print('--module or -m');
  print('  The name of the module. Use a lowercase_with_underscores.');
  print('--name or -n');
  print(
      '  The name of the object under a module. Specify this when generating');
  print('  a page or an action. Use a lowercase_with_underscores.');
  print('--skeleton or -s');
  print('  Generates the skeletal files of the framework under lib and test');
  print('--type <item> or -t <item>');
  print('  Where <item> is any of: module, page, action.');
  print(
      '  When generating a page. A state and model is provided along with it.');
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
