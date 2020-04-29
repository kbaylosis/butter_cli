# butter_cli

Generates the butter framework scaffolding.

## Usage

```
Usage: butter_cli [<options>] --destination <destination>

Generates the butter framework scaffolding.

Options:
--help or -h
  Show this information
  When generating a page. A state and model is provided along with it.
--module or -m
  The name of the module. Use a lowercase_with_underscores.
--name or -n
  The name of the object under a module. Specify this when generating
  a page or an action. Use a lowercase_with_underscores.
--skeleton or -s
  Generates the skeletal files of the framework under lib and test
--type=<item> or -t
  Where item is any of: module, page, action.

To generate a project skeleton: 
 butter_cli -s -d /path/to/project

To generate a module: 
 butter_cli -t module -m home -d /path/to/project

To generate a page: 
 butter_cli -t page -m profile -n edit_profile -d /path/to/project
```