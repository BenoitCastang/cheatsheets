# Options
## Manage options
```bash
.vimrc ## vim config file
~/.vimrc ## default location
~/.config/nvim/init.lua ## default nvim config file location
echo $MYVIMRC ## print config file location

## There are two types of options: boolean options and options with value
set number ## set boolean option
set nonumber ## unset boolean option
set number! ## toggle option

set numberwidth = 4 ## set option with value
set number numberwidth = 4 ## set multiple options at the same time

set number? ## print option value
set number? numberwidth? ## check multiple options at the same time

## Options can be global or local
## A global option is applied to a new file, not a local one
set number ## set global and local options at the same time
setlocal number ## set local option
```
## List of options
```bash
set wrap ## lines extend on multiple lines
set nowrap ## lines extend beyond horizontal limit of the screen

set number ## enable absolute line numbers
set nonumber ## disable absolute line numbers

set relativenumber ## enable relative line numbers
set norelativenumber ## disable relative line numbers

set list ## enable listchars (blank space characters)
set nolist ## disable listchars

set spell ## enable check for misspelled words
set nospell ## disable check for misspelled words
set spelllang=eng ## set spell language

set signcolumn=yes ## always show
set signcolumn=no ## never show
set signcolumn=auto ## depends wether there is something to display or not
```
# Shortcuts
## Registers
```bash
reg ## see registers
"0p ## paste last yank
"ayy ## in register a copy the line
```
## Repeat
```bash
. ## repeat the previous action
; ## repeat the previous f/F/t/T action
, ## repeat the previous f/F/t/T action in reverse
```
## Increment
```bash
c-a ## increment by 1 next number
c-x ## decrement by 1 next number
5c-a ## increment by 5
```
## Case
```bash
gUU ## make line uppercase
guu ## make line lowercase
```
## Pipe
```bash
echom "Hello" | echom "World!" ## write two commands on the same line
```
## Autocompletion
```bash
c-n ## next match
c-p ## previous match
c-x ## accept selection
c-x c-f ## auto complete file path
c-x c-l ## auto complete line
```
## Next occurrence
```bash
* ## go to next identical word
# ## go to previous identical word
```
## Macros
```bash
qj ## record a macro
q ## quit recording
@j ## run macro

5@j ## run macro 5 times
2,5norm @j ## run same macro on lines 2 to 5
%norm @j ## run macro on whole file
g/pattern/norm @j ## run macro when pattern matches

## macro are saved in registers
registers ## see macros
let @j='' ## delete macro
```
## Marks
```bash
## marks are persistent through files and exiting vim
## they work in visual mode and operator pending mode

## local marks
ma ## set mark of the cursor position to letter a
'a ## go to that line
`a ## go to exact cursor position

## global marks
ma ## works through multiple files
'a ## go to that line of the other file
`a ## go to exact cursor position of the other file

:## predefined special marks
'' ## go to line of last position
'' ## go to line where vim was exited
'^ ## go to line of last insert
'. ## go to line of last change

## command-line
mark a ## set a mark
marks ## see all marks
delmarks a ## delete a mark
delmarks ! ## delete all marks
```
## Visual mode
```bash
v ## enter visual mode
V ## line by line visual mode
c-v ## block visual mode

`< ## go to start of last visual selection
`> ## go to end of last visual selection

## block visual mode
I ## insert before each selected block
A ## insert after each selected block
```
# Commands
## Help
```bash
help {command} ## open help buffer
CTRL-] ## jump to a subject within help buffer

vim --version ## get version of vim installed
```
## Read
```bash
read ## insert content from outside
read file ## insert content of a file
read !command ## insert output of a command
```
## Source
```bash
source $MYVIMRC ## run file content
```
## Write
```bash
write ## save
quit ## quit
wq ## save and quit
q! ## quit without saving
ZZ ## save and quit
ZQ ## quit without saving
```
## Syntax
```bash
## syntax creates text pattern groups, so they can be linked to highlight groups for them to change text style

syntax enable ## enable syntax highlighting on current file
syntax on ## stronger than enable: it both turns syntax highlighting on and automatically sets it up for new files
syntax off ## disable syntax highlighting on current file
syntax clear ## clear all syntax highlighting rules on current file

syntax list ## show list of current syntax groups
syntax list comments ## show a specific group only

## create custom syntax groups
## by default the group is linked to the highlight with the same name
syntax match MyMatch /##.*/ ## detect pattern and apply highlight on all pattern
syntax keyword MyKeyword if elif else fi ## detect single word patterns and highlight only the word
```
## Ex
```bash
Q ## enter ex mode
```
## substitution
```bash
s/pattern/replacement ## replace first match of current line
4s/pattern/replacement ## replace on line 4
1,10s/pattern/replacement ## replace on lines 1 to 10
%s/pattern/replacement ## replace on all file

s/pattern/replacement/g ## replace all matches
s/pattern/replacement/c ## ask confirmation

s/\d/#/g ## works with regex - replace digits with hastags

## delete characters

s/pattern// ## replace match by nothing
%s/\s\+$//e ## replace by nothing all whitespaces at the end of lines, without showing errors

## delete lines

/pattern/d ## delete current line if matches pattern
g/pattern/d ## delete all lines matching pattern
g/pattern/s/foo/bar/g ## replace if line matches pattern
```
# Mapping
## Map
```bash
map v dd ## make the v key do dd
map v ## print user mapping for v

map <space> dd ## special characters
map <cr> dd ## enter key
map <c-d> dd ## ctrl key
map <m-d> dd ## alt key
map <s-tab> dd ## shift key

map kj ifoo ## enter insert mode and write foo
map kj :vsplit<cr> ## enter command mode and execute vsplit

map v <nop> ## set key to no operation

map <buffer> v <nop> ## set a mapping that applies only in the current buffer
## local mapping has the priority over general mapping

unmap v ## remove binding

map ## create a key binding taking account of other custom bindngs
noremap ## create a key bnding using default bindings

map ## key binding for all modes but insert mode
nmap ## key binding for normal mode
imap ## key binding for insert mode
cmap ## key binding for command-line mode
vmap ## key binding for visual mode
omap ## key binding for operator-pending mode (an operator has been entered and vim waits for a motion)

nnoremap, inoremap, cnoremap, vnoremap, onoremap ## key binding from respective modes using default bindings
nunmap, iunmap, cunmap, vunmap, ounmap ## remove key binding from respective modes''

## examples
## operator-pending mode, after an operator (y, d, c) waits for a motion and execute operation between current cursor position and final cursor position (or selected text if visual mode)
onoremap j ejela( ## complex movement
onoremap j /fi<cr> ## dj will remove text till 'fi' is found
```
## Motions
```bash
:2 ## go line 2
:2p ## go to line 2

e ## go end of word
E ## go enf of WORD

w ## go begging of word
W ## go begging of WORD

b ## go beginning of previous word
B ## go beginning of previous WORD

^ ## go beginning of line
$ ## go end of line

/word ## go to word
```
# Abbreviations
```bash
## abbreviations trigger when hitting space in insert mode
abbreviate teh the ## writing teh becomes the
abbreviate ## print list of abbreviations
unabbreviate teh ## remove abbreviation

iabbreviate teh the ## set insert mode only abbreviation
iabbreviate ## print list of insert mode abbreviations
iunabbreviate teh ## remove insert mode abbreviation

cabbreviate teh the ## set command-line mode only abbreviation
cabbreviate ## print list of command-line mode abbreviations
cunabbreviate teh ## remove command-line abbreviation

abbreviate btw by the way ## abbreviation expands to multiple words

## the big difference with mappings is that the abbreviation is replaced only if followed by non-keyword character (space, enter, period, comma...)
set iskeyword? ## get the list of ASCII characters that are keyword characters

abbrev <buffer> teh the ## abbreviation for the current buffer only
```
# Autocommands
## Syntax
```bash
## autocommands run commands when certain events happen
autocmd BufNewFile *.txt write ## when opening a buffer which is a new file, if the file is a .txt, then execute the comment write to save it

autocmd BufRead,BufNewFile * set number! ## multiple events
autocmd BufRead *.html,*.js set number! ## multiple patterns
autocmd BufRead * ## multiple commands

autocmd ## print active rules
autocmd * ## print active rules a specific pattern
autocmd BufRead * ## print active rules for both

## filetype event
autocmd FileType python set number! ## no need for a pattern
set filetype? ## print buffer's detected filetype
set filetype=python ## set buffer's filetype
autocmd filetype python ## list given filetype autocommands
```
## Normal
```bash
## autocommand by default executes in command line, the normal command is then needed to perform normal mode actions it
normal G ## perform normal mode action
normal! G ## ignore user remappings

normal! ifoo ## inserts foo
normal! v ## enters visual mode

## unlike map, the normal command does not change mode with :, / or ?, though it does with i and v
normal! :w ## wont work

## does not recognize special characters also
normal! ifoo<cr> ## inserts foo<cr>

1,10normal A; ## interact with multiple lines
%normal A; ## interact with whole file
g/pattern/normal A; ## interact with matching pattern
```
## Execute
```bash
## run a string as a command
execute "echom 'Hello, world!'"

## allows to build a command dynamically
execute "vsplit " . bufname("%") ## using the result of a function

## with normal it allows it to use :, / and ?
execute "normal! :vsplit\<cr>" ## but special characters need to be escaped
```
## Groups
```bash
## autocommands are duplicated when sourcing vimrc, augroup merge autocommands
augroup test
 autocmd! ## clear autocommand group
 autocmd BufWritePre * set number!
 autocmd BufWritePre * set wrap!
augroup END
```
## Events
```bash
FileType python ## once filetype option has been set

BufNewFile ## when is opened a buffer with a new file
BufRead ## when reading a file

BufEnter ## when entering a buffer
BufLeave ## when leaving a buffer

BufWritePre ## before saving file
BufWriteCmd ## instead of saving file
BufWritePost ## after saving file

TextChanged ## text was changed in normal mode
TextChangedI ## text was changed in insert mode

InsertEnter ## entering insert mode
InsertChange ## typing while in insert mode
InsertLeave ## leaving insert mode

CmdwinEnter ## entering command-line window
CmdwinLeave ## leaving command-line window

CursorMoved ## the cursor was moved in normal mode
CursorMovedI ## the cursor was moved in insert mode

ColorScheme ## after loading a color scheme
MenuPopup ## before showing the popup menu

VimEnter ## entering vim
VimLeave ## leaving vim
```
## Patterns
```bash
* ## matches any file
*.txt ## matches any file ending in .txt
```
# Fold
```bash
zf ## create fold
zd ## delete fold
zo ## open fold
zc ## close fold
za ## toggle fold
zA ## toggle all folds under the cursor
zR ## open all folds in the file
zM ## close all folds in the file
zE ## delete all folds in file
4,9fold ## command to make a manual fold
```
# Buffers
```bash
## buffers are files loaded in vim - all modifications or configurations are temporary stored in buffers before the file is saved
## buffers can be hidden, not showed on screen, but in vim memory

vim <file> ## open a buffer
vim <file1> <file2> ## open two buffers at the same time
e <file> ## open a buffer

ls ## display open buffers
buffers ## display open buffers

buffer 1 ## switch to buffer 1
bnext ## switch to next buffer
bprevious ## switch to previous buffer
buffer# ## swith to previous buffer

bdelete 1 ## unload buffer 1
bdelete ## unload current buffer

map <buffer> h dd ## set a mapping only in current buffer - has priority over not buffer-specific mappings
```
# Vimscript
## Echo
```bash
echo 'message' ## echo a message
echomsg 'message' ## echo a message that remains in the message-history
messages ## show message-history

echo var ## print a variable
echo 3 + 1 ## echo a result

## vim coerces strings to integers
echom "hello" + 10 ## prints 10
echom "10hello" + 10 ## prints 20
echom "hello10" + 10 ## prints 10
```
## Variables
```bash
let foo = 42 ## declare a variable
echo foo ## print a variable

## buffer-scoped variables can be defined with a b: namespace
let b:foo = 42 ## declare
echo b:foo ## print

## option variables have an ampersand namespace
let &numberwidth = 2 ## set option a variable
let &number = 1 ## set boolean option variable
echo &number ## 0 is disabled, 1 is enabled

let &numberwidth = &numberwidth + 4 ## variables allow maths

## local option variables have a l: namespace
let &l:number = 1 ## local option variable
echo &l:number ## print local option variable

## registers have an at sign namespace
let @a = "Hello!" ## set a register as variable
echo @a ## print register
```
## Conditionals
### If
```bash
:if 0
:    echom "if"
:elseif "nope!" ## strings have false value
:    echom "elseif"
:else
:    echom "finally!"
:endif
```
### Comparisons
```bash
1 < 10 ## true
number > 10 ## with variable
10 == 5 ## false

## string comparisons depend on the user's &ignorecase value
"foo" == "BAR"

"foo" ==? "BAR" ## case-insensitive comparison
"foo" ==# "BAR" ## case-sensitive comparison
```
## Functions
### Syntax
```bash
function Hello() ## initial letter must be capital
  echom "Hello, world!"
endfunction

call Hello() ## call function

function Hello() ## return a value
  return 1
endfunction

echom Hello() ## print return value

if Hello() ## use return value as a comparison
  echom "Function returns true !"
endif
```
### Arguments
```bash
## arguments have a specific name space a:
function DisplayName(name)
  echom a:name
endfunction

call DisplayName("Joe")

## handle variable number of arguments
function Vargs(...)
  echom a:0 ## number of arguments
  echom a:1 ## first argument
  echo a:000 ## list of given arguments
endfunction

function Vargs2(foo, ...) ## one argument plus variable number of arguments

function Assign(foo)
  let a:foo = "Nope" ## can't assign a new value to a function argument
  let foo_tmp = a:foo ## must use an intermediate variable
  let foo_tmp = "Yep"
  echom foo_tmp
endfunction

call AssignGood("test")
```
### Built-in
```bash
echom bufname("%") ## current buffer name
```
## Numbers
### Types
```bash
## float
echom 4.3

## hexadecimal
echom 0xff ## prints 255
echom 0xa0 - 0x92 ## prints 14

## octal
echom 024 ## prints 20

## exponential
echom 7.0e2 ## prints 700
echom 7.0e-1 ## prints 0.7
```
### Operations
```bash
## coercion
echom 2 * 2.0 ## prints 4.0

## division
echom 3 / 2 ## print 1
echom 3 / 2.0 ## print 1.5
```
### Functions
```bash
## length of a number is the number of digits in it
echom strlen(34) ## returns 2
echom len(131) ## returns 3
```
## Strings
### Syntax
```bash
echom "Hello, world!" ## print a string

## the + operator coerces everything to number (int)
echom "Hello, " + "word!" ## prints 0
echom "3 mice" + "2 cats" ## prints 5
echom 2 + "1.5" ## prints 3

## the concatenation operator is . - it coerces everything to strings
echom "Hello, " . "world!" ## concatenation
echom 10 . "foo" ## prints 10foo
echom 10.1 . "foo" ## prints 10.1foo

## escape characters
echom "foo\"bar\" ## escape character
echom "foo\\bar" ## escape \
```

```bash
## special characters
echom "foo\nbar" ## prints foo^@bar
DisplayName
echo "foo\nbar" ## echom cant handle special characters

## literal strings
echom '\n\\' ## print \n\\
echom 'Its''s okay' ## escape single quote
```
### Functions
```bash
## length
echom strlen("foo") ## prints 3
echom len("foo") ## prints 3

## split
echom split("pif paf pouf") ## returns the list ['pif', 'paf', 'pouf']
echom split("pif, paf, pouf", ",") ## change separator from default " " to ","

## join
echom join(["blop", "plouf"], "...") ## prints blop...plouf
```

```bash
## case
echom tolower("FOO") ## prints foo
echom toupper("bar") ## prints BAR
```
# Bash
## Vim mode
```bash
set -o vi ## switch to vim mode in bash

## change vim mode commands in .inputrc
set editing-mode vi ## set the default editing mode to vi
set keymap vi-command ## set the default keymap to vi-command mode
jj: vi-movement-mode ## bind the jj sequence to switch to vi movement mode
```
## Vim command
```bash
## vim -c put you in vim in command-line mode - all interactions from command line is so valid
vim -c 'normal iblop' ## do command through command line (and stay in vim)
vim -c 'normal Gocrac' -c 'wq' file ## chain commands, finish getting out of vim
vim -c '/pattern' file ## search in file
```
