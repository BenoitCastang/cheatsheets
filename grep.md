# Syntax
## Basics
```bash
## search a pattern and return lines matching it - works with stdin and files
grep foo ## search pattern in stdin, here user input
ls -l | grep foo ## search pattern in stdin, here redirected command output
grep foo <files> ## search pattern in file

## bash regex and grep regex are different
ls *.txt ## returns anything then .txt
grep *.txt ## does not even work

## basic syntax
grep a ## match any a
grep blop ## match any blop

## anchors
grep ^blop ## if line begins with blop
grep crac$ ## if line ends with crac
grep ^flop$ ## if the entire line is exactly flop

## double quotes is safer, prevents shell globbing
grep ^flop$ ## might not work
grep "^flop$" ## always works

[] ## matches sets of characters
[abc] ## a, b, or c
[a-c] ## from a to c
[^abc] ## doesnt match characters within the brackets

grep [A-Z] ## any uppercase character
grep [a-z] ## any lowercase character
grep [A-z] ## any letter

. ## any single character, one time
grep "..ees" ## any character two times then ees

\ ## escape meaningful characters
grep \[\+\\ ## match [+\
```
## Extended
```bash
## most of these need grep -E option to work

## repetition operators
? ## 0 or 1
grep "on?" ## o then n is optional
* ## 0 or more
grep "ap*" ## a then p is 0 or more times
+ ## 1 or more
grep "ap+" ## a then p is mandatory, once or more times

## custom repetitions
{n} ## n times
{n,} ## n or more times
{n,m} ## between n and m times

## or
grep -E "crac|blop" ## crac or blop
grep -E "file(1|2)" ## file1 or file2
```
## Blanks
```bash
grep the end ## wont work
grep "the end" ## will work

grep " " ## match a space character alone

grep -Pz "\t" ## match tabs
grep -Pz "\n" ## match new lines (line feed)
grep -Pz "\r" ## match carriage returns
## on linux, \n is usually \n (down one line) + \r (back to beginning of line)
grep -Pz "\f" ## match next page (form feed)
```
## Character classes
```bash
## Common predefined character classes
grep [[:digit:]] ## digits
grep [[:alpha:]] ## letters
grep [[:alnum:]] ## letters + digits

grep [[:lower:]] ## lowercase characters
grep [[:upper:]] ## uppercase characters

grep [[:space:]] ## spaces and tabs
grep [[:punct:]] ## punctuation signs

grep [^[:digit:]] ## no numbers

## shortcuts
grep -P "\d" ## digits
grep -P "\D" ## non digits

grep -P "\w" ## word characters i.e. letters + digits
grep -P "\W" ## non-word characters i.e. spaces and tabs and punctuation signs

grep -P "\s" ## white spaces
grep -P "\S" ## non white spaces
```
# Options
```bash
grep -v ## reverted grep, show no match entries
grep -c ## display only number of matches
grep -i ## ignore case
grep -r ## recursive
grep -l ## show file name only, the line line matching the pattern
grep -L ## show file name when not matching
grep -n ## show line numbers with matches
grep -w ## match whole word only
grep -x ## match whole line
grep -A 2 ## after context: show two lines of the file afer each match
grep -B 2 ## before context: show two lines of the file before each match
grep -C 2 ## context: show two lines of the file around each match
grep -o ## show only matching part of each line
grep -e pattern1 -e pattern2 ## specify multiple patterns, search pattern1 or pattern2
grep -q ## quiet, no output and returns 0 if match is found, 1 if not
grep -P ## Perl-compatible
grep -z ## treat whole file as one "line" by using NUL as separator
grep -E ## extended regex
```
