
import 'package:args/args.dart';
import 'package:butter_cli/butter_cli.dart';

void main(List<String> arguments) {
  final parser = ArgParser();
  parser.addOption('destination', abbr: 'd');
  var results = parser.parse(arguments);

  Scaffolding(results['destination']).generate();
}