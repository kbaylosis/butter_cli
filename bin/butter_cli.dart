// import 'package:args/args.dart';

import 'package:butter_cli/butter_cli.dart';

//
// 1. Create butter scafolding
// 2. Create new module
// 3. Create new page
// 4. Create new state
// 5. Create new action
//

void main(List<String> arguments) {
  // final ArgParser argParser = ArgParser();

  print(Paths.getCurrentDir());
  print(Paths.getScriptDir());

  // Scaffolding.generate(Paths.getCurrentDir());
  Scaffolding.generate('/Users/kennethbaylosis/data/temp/sample/lib');
}
