# viper_rubocop
Viper package for Rubocop static analyzer

## Version 0.1.0

## Abstract

viper_rubocop is a Viper editor package for parsing the contents of a Rubocop JSON file.
It adds the command 'load_cop'  to the editor which parses the output of rubocop --format json

## Installation

Install this package in your packages directory for your Viper runtime: ~/.viper/packages:
```
cd ~/.viper/packages
git clone git@github.com:edhowland/viper_rubocop.git
```

### System Requirements

This package, like all Viper packages, requires Viper version 1.1 or greater. If this is not the version in the viper master
branch, switch to feature/1.1.0 before installing Viper.

## Usage

Once you have generated a Rubocop result file in JSON by using '--format json' to the rubocop command,
you can load it and parse it into a scratch buffer with the 'load_cop' command. 

You must first load the viper_rubocop package:

```
viper --package viper_rubocop
```

Alternatively, you can issue the command 'package viper_rubocop'.

### The 'load_cop' command

Issue the command 'load_cop rubocop.json'. The filename 'rubocop.json'
is the pathname of the JSON file you generated with the --format json option to rubocop.

### Sample output

```
Rubocop analyzer results
Time: 2016/03/10 21:55
Summary: offense count: 137
F:bin/viper
	Extra blank line detected.:L:11:C:1:Style/EmptyLines
	Trailing whitespace detected.:L:32:C:18:Style/TrailingWhitespace
	Use 2 (not 3) spaces for indentation.:L:42:C:3:Style/IndentationWidth
	Inconsistent indentation detected.:L:48:C:5:Style/IndentationConsistency
	Extra blank line detected.:L:140:C:1:Style/EmptyLines
F:lib/bindings/command_bindings.rb
	Extra blank line detected.:L:105:C:1:Style/EmptyLines
	Unused block argument - `b`. If it's necessary, use `_` or `_b` as an argument name to indicate that it won't be used.:L:107:C:17:Lint/UnusedBlockArgument
	Unused block argument - `b`. If it's necessary, use `_` or `_b` as an argument name to indicate that it won't be used.:L:108:C:17:Lint/UnusedBlockArgument
```

After the summary information, you will get a list of files with offenses
indented by a Tab character. Each offense is of the form:

Message:L:line_number:C:column:Cop name

You can use this information to load the offending file with the 'o pathname' command. Then use the 'g line_number' to got to the
line with the offense. Use the Control k  column reporter to see what the column of the line. Use the 
Control t key to return to the analyzer results and continue fixing more source code.

