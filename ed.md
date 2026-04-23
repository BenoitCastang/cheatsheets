# Syntax
```bash
## ed stands for editor
## it is the ancestor of ex, vi, vim and sed

ed ## enter ed - open empty buffer
ed file.txt ## open file with ed and print file size
## ed opens a buffer that contains temporary file data

? ## default ed prompt when doing nothing or something meaningless

w ## write, save changes to current file and print file size
w file.txt ## write to new file or other file

q ## quit ed

wq ## write and quit

e file.txt ## open another file

u ## undo action (except print)
## doing u again cancels the going back, like ctrl-R, so last action is the only ever action you can undo

H ## get error messages

ed -p : file.txt ## customize ed prompt

ed -E ## extended regex support

!ls ## execute external shell command then go back to ed
```
# Actions
```bash
## ed command is an address + an action
## default addressing is current line, default action is print

,p ## print all lines
4d ## delete line 4
/blop/d ## delete line containing blop
## without address, the action is performed on the current line

p ## print
n ## print with line number

a ## enter append text mode
i ## enter insert text mode
. ## exit append or enter text mode

d ## delete
c ## change - erase and insert text

m ## move
3m5 ## move line 3 under line 5

t ## transfer (copy)
3t5 ## copy line 3 under line 5
 
s/new/old ## substitute first match
## substitute command has flags to modify its behavior
s/new/old/g ## substitute all matches of the line
s/new/old/i ## case-insensitive regex

= ## print line number
3= ## print line 3 number, without moving the cursor
$= ## print total of lines
/foo/= ## print line number of next match

r ## read - append input on next line
0r !ls ## in first line insert output of ls
r file ## insert content from a file
## read also prints how much bytes it imported each time
```
# Addressing
```bash
## addressing sets a range where to perform an action
## without action, the range sets the new place of the cursor at its end

1 ## line 1
. ## current line
$ ## last line

1,3 ## line 1 to 3
1,$ ## line 1 to last line
, ## shortcut for 1,$
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

g/foo/ ## global command - search all matches
g/re/p ## origin of grep
g/foo/s/old/new ## replace all matches in file

v/foo ## inverse search - NOT matching

/foo/I ## case-insensitive search - available for any regex-bassed command, like searches and substitution

## marks
kx ## set a mark x to current line
'x ## use that line as an address
```
