// import 'package:args/args.dart';

import 'package:butter_cli/butter_cli.dart';
import 'package:butter_cli/src/action.dart';
import 'package:butter_cli/src/page.dart';

//
// 1. Create butter scafolding
// 2. Create new module
// 3. Create new page
// 4. Create new state
// 5. Create new action
//

void main(List<String> arguments) {
  // final ArgParser argParser = ArgParser();

  // print(Paths.getCurrentDir());
  // print(Paths.getScriptDir());
  
  Scaffolding('/Users/kennethbaylosis/data/temp/sample').generate();

  Module('init', '/Users/kennethbaylosis/data/temp/sample').generate();
  Module('home', '/Users/kennethbaylosis/data/temp/sample').generate();
  Module('newsfeed', '/Users/kennethbaylosis/data/temp/sample').generate();
  Action('home', '/Users/kennethbaylosis/data/temp/sample').generate('eat_the_food');
  Page('init', '/Users/kennethbaylosis/data/temp/sample').generate('forgot_pw'); 
}
