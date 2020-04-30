# butter_cli

![Pub Version](https://img.shields.io/pub/v/butter_cli) [![Build Status](https://travis-ci.org/kbaylosis/butter_cli.svg?branch=master)](https://travis-ci.org/kbaylosis/butter_cli)

Generates the butter framework scaffolding.

## Getting Started

Install the butter_cli using the following command:

```
pub global activate butter_cli
```

## Usage

```
Usage: butter_cli [<options>] --destination <destination>

Generates the butter framework scaffolding.

Options:
--help or -h
  Show this information
--module or -m
  The name of the module. Use a lowercase_with_underscores.
--name or -n
  The name of the object under a module. Specify this when generating
  a page or an action. Use a lowercase_with_underscores.
--skeleton or -s
  Generates the skeletal files of the framework under lib and test
--type=<item> or -t
  Where item is any of: module, page, action.
  When generating a page. A state and model is provided along with it.

To generate a project skeleton: 
 butter_cli -s -d /path/to/project

To generate a module: 
 butter_cli -t module -m home -d /path/to/project

To generate a page: 
 butter_cli -t page -m profile -n edit_profile -d /path/to/project
```
