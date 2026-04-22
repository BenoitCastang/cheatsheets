# Syntax
```bash
## stream editor - take a stream of text as input, scan each line for a regex pattern and perform an action on each match

sed "command" ## input is stdin
sed "command" filename ## input is file
## stdout is the output, not the file himself
ls | sed "command" ## input is output of a command
```
# Commands
```bash
## substitution - s///
sed "s/old/new/" ## replace old by new once per line in all file

## flags
sed "s/old/new/g" ## global - replace all matches of line
sed "s/old/new/N" ## substitute only Nth occurrence

sed "s/OLD/new/i" ## case-insensitive matching
sed "s/old/new/p" ## print line if substitution happened
sed "s/old/new/w file" ## write changed lines to a file

## deletion - /d
sed "/pattern/d" ## delete lines matching pattern
sed "/^$/d" ## delete all empty lines

## print - /p
sed "/pattern/p" ## print lines matching pattern

## changing - c\
sed "c\new text" ## replace all lines by new text

## append - a\
sed "a\new text" ## append new line of text after each line

## prepend - i\
sed "i\new text" ## insert new line of text before each line

## transliterate characters - y///
sed "y/abc/123/" ## replace a by 1, b by 2, c by 3 in all file

## logical operators
sed "/blop\|crac/p" ## or - needs escaping
sed "s/blop/crac; s/flip/plouf" ## do two commands

## addressing
sed "4s/old/new/" ## replace only on line 4
```
# Options
```bash
## in-place editing
sed -i ## directly modify file and save it
sed -i.backup ## crete also a backup file

sed -E "s/[[:alnum:]]{4}/foo/" ## handle extended regex

sed -n ## silent mode
```
