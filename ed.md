# Syntax
```bash
## ed stands for editor
## it is the ancestor of ex, vi, vim and sed

ed ## enter ed - open empty buffer
ed file.txt ## open file with ed and print file size
## ed opens a buffer that contains temporary file data

w ## write, save changes to current file and print file size
w file.txt ## write to new file or other file

q ## quit ed
## warns for modified buffer first
Q ## immediately quit ed

wq ## write and quit

e file.txt ## open another file

u ## undo action (except print)
## undo is its own reverse, it can only undo the last command

? ## default ed answer when invalid address or unknown command
<cr> ## print next line - shows ? is no next line

h ## get error message from previous ?
H ## toggle error messages for each command
## invalid address, unknown command, warning modified buffer etc.

ed -p : file.txt ## customize ed prompt

ed -E ## extended regex support

!ls ## execute external shell command then go back to ed
```
# Actions
```bash
## ed command is an address + an action
## each action has a default addressing, often the current line
## default action is generally print

,p ## print all lines
4d ## delete line 4
/blop/d ## delete line containing blop
## without address, the action is performed on the current line

## print suffixes
p ## print
n ## print with line number
l ## list - show tabs, new lines, ascii etc

a ## enter append text mode
i ## enter insert text mode
. ## exit append or enter text mode

d ## delete
c ## change - erase and insert text

x ## paste the content from the cut buffer
## the cut buffer is filled with d, c, y, s, j

m ## move
3m5 ## move line 3 under line 5

t ## transfer (copy)
3t5 ## copy line 3 under line 5

## join lines
j ## join current line with line below
5,6 ## join line 5 and 6

s/new/old ## substitute first match
## substitute command has flags to modify its behavior
s/new/old/g ## substitute all matches of the line
s/new/old/2 ## substitute only match 2
s/new/old/i ## case-insensitive regex

& ## replace by all match
s/new/[&] ## replacer new by [new]

\1, \2 ## replace by capture groups
s/(foo)(.*)(bar)/\3\2\1/ ## swap words

= ## print line number
3= ## print line 3 number, without changing the address
$= ## print total of lines
/foo/= ## print line number of next match

r ## read - append input after addressed line
r file ## insert at the end of the file the content from another file
0r !ls ## in first line insert output of ls
## read also prints how much bytes it imported each time
```
# Addressing
```bash
## addressing is like motion in vim, it allows movement and, added to an action, it sets the range of effect for that action

1 ## line 1
. ## current line
$ ## last line

1,3 ## line 1 to 3
1,$ ## line 1 to last line
, ## shortcut for 1,$
% ## shortcut for 1,$
.,$ ## current line to last line
; ## shortcut for .,$

- ## previous line
+ ## next line

-3 ## 3 lines before
+3 ## 3 lines after

2+3 ## line 5
$-1 ## one line before last one
/foo/-p ## print line before search result

/foo/ ## search next match
/foo/,/bar/p ## print from pattern to line containing foo to line containing bar

?foo? ## search previous match
?foo?,/bar/p ## print from previous foo to next bar

g/foo/ ## global command - search all matches of range
## default range is all file
4,7g/foo/ ## specify search range
g/re/p ## origin of grep
g/foo/s/old/new ## replace all matches in file

G ## interactive mode of g
G/foo ## search for each match, and waits for a command
## only one line command work here: p, d, s, m, t

v/foo ## inverse search - NOT matching
V/foo ## interactive mode of v

/foo/I ## case-insensitive search - available for any regex-bassed command, like searches and substitution

## marks
kx ## set a mark x to current line
'x ## use that line as an address
```
