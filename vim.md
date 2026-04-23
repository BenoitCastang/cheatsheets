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
# Normal mode
## Commands
### Keys
```bash
<esc> ## back to normal mode

i ## insert
I ## insert beginning of line

a ## append after cursor
A ## append end of line

Y ## yank line

D ## delete until end of line

C ## change until end of line (delete then enter insert mode)

## substitute deletes its target and enters insert mode
s ## substitute character
S ## substitute line

o ## open line below
O ## open line above

p ## paste after
P ## paste before

u ## undo change
U ## undo all changes of a line

r ## replace one character by another
R ## replace mode - erase as you write

. ## repeat the previous action
& ## repeat last substitute command

J ## join lines
K ## help - default is man search

x ## delete one character
<del> ## same as x
X ## delete one character to the left

v ## visual mode
V ## line visual mode

: ## command-line mode
Q ## ex mode

m ## set mark

q ## record macro

~ ## toggle case

<pageup> ## scroll up one page
<pagedown> ## scroll down one page

<F1> ## open help window
<F2-12> ## no command by default

## [count] + command allows to repeat command [count] times
3dd ## delete 3 lines
```
### Macros
```bash
## macros take sequences of characters from registers and execute them as commands
qj ## record a macro
q ## quit recording
@j ## run macro

@@ ## run last recorded macro
5@j ## run macro 5 times
2,5norm @j ## run same macro on lines 2 to 5
%norm @j ## run macro on whole file
g/pattern/norm @j ## run macro where pattern matches

registers ## see macros
let @j='' ## delete macro by emptying register
```
### Registers
```bash
## registers store every copied text
registers ## see registers

"0p ## paste last yank
"ayy ## in register a copy the line
let jjj
```
## Motions
### Keys
```bash
h ## one character left
<left> ## same as h
l ## one character right
<right> ## same as l

<bs> ## one character left across lines
<space> ## one character right across lines

## a logical line is a real, physical line of the file, like line 1, 2 etc, meaning if the line is wrapped by the display, going on line down jumps over the wrapped line
## gj and gk are used to not jump over wrapping
j ## one logical line down - same column
<down> ## same as j
k ## one logical line up - same column
<up> ## same as k

- ## one logical line up - column 0
+ ## one logical line down - column 0
<cr> ## same as +

w ## next word
W ## next Word

e ## end word
E ## end Word

b ## previous word
B ## previous Word

$ ## end of line
<end> ## same as $

^ ## soft beginning of line (first non blank character)
<home> ## same as ^
_ ## soft beginning of line (combined with a [count] to go multiple lines down)
2_ ## beginning of line plus one line down
0 ## hard beginning of line (really first column, so it crosses spaces but if the line begins with a tab, as the tab is really one character but looks like multiple (depends on the set tabstop option), it can look its not the real beginning of the line)
set list ## show real tabs
set tabstop=8 ## set tab visual length

{ ## beginning of paragraph
} ## end of paragraph

## a sentence is a sequence of text ending in ., ? or !, followed by a space, tab, or the end of the line
## if there is no ., ? or !, it goes to the next end of line
( ## beginning of sentence
) ## end of sentence

## followed by a character
f ## find next character
F ## find previous character

## until, meaning one character before find motion
t ## forward find
T ## backward find

; ## repeat find motion
, ## reverse repeat find motion

H ## high of the screen
L ## low of the screen
M ## middle of the screen

% ## navigate between opening and closing pair parenthesis, brace etc.

## go to [count] column
| ## without [count], beginning of line
5| ## column 5 of the current line
```
### Text objects
```bash
## text objects are a combination of a range, 
iw ## inside word
aw ## around word

"
'
(
)
<
>
B
W
[
]
`
b
p
s
t
w
{
}
```
### Searching modes
```bash
## make a search and jump to the first match

/foo ## forward search
?bar ## backward search

## after a research, to cycle through results
n ## next find
N ## previous find

// ## repeat last forward search
?? ## repeat last backward search

* ## search forward identical whole words
# ## search previous identical whole word

/foo\c ## case case-insensitive search

set ignorecase ## make all searches case-insensitive
set smartcase ## if the search includes any uppercase letter, it becomes case-sensitive

set hlsearch ## highlight all search results
noh ## clear results
```
### Marks
```bash
## set a mark to a place and jump to it
## marks are automatically saved by vim

## single quote is line-level jump
## backstick is precise column jump

## local marks
ma ## set mark of the cursor position to letter a
'a ## jump to line of mark
`a ## go to exact cursor position of mark

## global marks
mA ## set mark across files
'A ## jump to that line of the other file
`A ## jump to exact cursor position in the other file

## command-line
mark a ## set a mark
marks ## see all marks
delmarks a ## delete a mark
delmarks! ## delete all local marks of the file

## vim-predefined special marks
'' ## jump to last mark jumped to
'^ ## jump to place of last insert
'. ## jump to place of last change
'[ ## jump to start of last changed or yanked text
'] ## jump to end of last changed or yanked text
'" ## jump where vim was exited
'0-9 ## history of marks of vim exit
'` ## last cursor position
`` ## last cursor position
```
## Operators
```bash
## operators wait for a motion, and perform an action until destination of the motion
## example: delete until 5 line below
## the moment an operator is waiting for a motion to come is called operator-pending mode

d ## delete
c ## delete then go insert mode
y ## yank or copy

> ## indent
< ## un-indent
= ## auto-indent

## repeat the operator means the target is the line
dd ## delete current line
>> ## indent current line

## External filter
## send a range of lines as input to a shell command to be replaced by command's output
!sort ## sort lines
```
## Prefixes
### G
```bash
gj ## one visual line up
gk ## one visual line down

gg ## top of file
G ## end of file

3gg ## go line 3
3G ## go line 3

gf ## open file under cursor

## case
gUU ## make line uppercase
guu ## make line lowercase

g_ ## go end of line (last character, stops before spaces or tabs in end of lines)
```
### Z
```bash
zo ## open fold
zc ## close fold

ZZ ## save and quit
ZQ ## quit without saving

## scroll file when it exceeds the size of the screen
zt ## scroll the file so the cursor is top of the screen
zb ## scroll the file so the cursor is bottom of the screen
zz ## scroll the file so the cursor is center of the screen
```
### Ctrl
```bash
## increment
c-a ## increment next number
c-x ## decrement number

5c-a ## increment by 5
```
### Square brackets
```bash
]] ## next section start
[[ ## previous section start

][ ## next section end
[] ## previous section end

]} ## end of current {} structure
[{ ## beginning of current {} structure

]) ## end of current () structure
[( ## beginning of current () structure

]m ## next method
[m ## previous method
]M ## next end of method
[M ## previous end of method

## for code with /* and */ comment style
]/ ## next end of comment
]* ## next end of comment
[/ ## previous beginning of comment
[/ ## previous beginning of comment

]s ## next misspelled word
[s ## previous misspelled word
```
# Visual mode
```bash
v ## enter visual mode
V ## line by line visual mode
c-v ## block visual mode

## once in visual mode, all normal commands are available to act on it or to move it, including searching modes and ex commands

o ## reverse selection direction
O ## (block visual mode) switch corner

gv ## reselect last selection

`< ## go to start of last visual selection
`> ## go to end of last visual selection

## block visual mode
I ## insert before each selected block
A ## insert after each selected block
```
# Operator-pending mode
```bash
## Operators wait for a motion
## then operator-pending mode acts like a visual mode where you cant see the selection
## you peform motions, and the operator does its operation between the original cursor position and the end of the given motion

de ## delete until end of word
d^ ## delete until beginning of line

dfp ## delet until character p

diw ## inside word

d:2 ## delete until line 2

d/word ## delete until word

d'a ## delete until mark a
```
# Command-line mode
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
## Substitution
```bash
## works like sed
s/pattern/replacement ## replace first match of current line
4s/pattern/replacement ## replace on line 4
1,10s/pattern/replacement ## replace on lines 1 to 10
%s/pattern/replacement ## replace on all file

## flags
s/pattern/replacement/g ## replace all matches
s/pattern/replacement/c ## ask confirmation
s/pattern/replacement/i ## ignore case

s/\d/#/g ## works with regex - replace digits with hastags

## delete characters
s/pattern// ## replace match by nothing
%s/\s\+$//e ## replace by nothing all whitespaces at the end of lines, without showing errors

## delete lines
/pattern/d ## delete current line if matches pattern
g/pattern/d ## delete all lines matching pattern
g/pattern/s/foo/bar/g ## replace if line matches pattern

& ## (normal mode) repeat last substitute command
s ## repeat last substitute command
%& ## replace on all file
```
# Autocompletion
```bash
c-n ## next match
c-p ## previous match
c-x ## accept selection
c-x c-f ## auto complete file path
c-x c-l ## auto complete line
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

autocmd ## print active rules
autocmd * ## print active rules a specific pattern
autocmd BufRead * ## print active rules for both

autocmd BufRead,BufNewFile * set number! ## multiple events
autocmd BufRead *.html,*.js set number! ## multiple patterns
autocmd BufWritePre * echom "toast" | vsplit ## multiple commands

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

## does not either recognize special characters
normal! :w<cr> ## does not work
normal! ifoo<esc> ## inserts foo<esc>
normal! ifoo<esc>Acrac ## exit insert mode wont be possible

## execute allows to go past those limitations by using strings, parsing special characters to replace it with terminal actions

1,10normal A; ## interact with multiple lines
%normal A; ## interact with whole file
g/pattern/normal A; ## interact with matching pattern
```
## Execute
```bash
## run a string as a command
execute "w"

## allows to build a command dynamically
execute "vsplit " . bufname("%") ## using the result of a function

## allows the normal command to use special characters, :, / and ?
execute "normal Iblop \<esc>A crac\<esc>" ## special characters
execute "normal! :w\<cr>" ## : example
execute "normal /word\<cr>" ## / example

## make a move before editing
onoremap ih ?^==<cr><esc>kvg_ ## it does not work because <cr> stops the motion so the operator only acts between the cursor and the next occurrence
onoremap ih :execute "normal! ?^==\<cr>" ## using a string prevents it, so the <cr> makes the search without getting out of the motion - however \<cr> does not work here, it needs \r
onoremap ih :execute "normal! ?^==\r" ## no error, but it needs an enter key at the end
onoremap ih :execute "normal! ?^==\r"<cr> ## it works but it deletes the text between the cursor and the search result, while we only want the search to move the cursor - thats because it needs a new selection to act on the last one instead
onoremap ih :execute "normal! ?^==\rkvg_"<cr> ## make a new selection so the operator operate on this one

## vim parsing messes up because the map command and the execute command do their own separate parsing, so as a rule literals like \t, \r, \e works better than special characters like <tab>, <cr>, <esc>
```
## Groups
```bash
## autocommands dont have names so they are duplicated if repeated or when sourcing vimrc => augroup give them a name so you cant repeat them, plus it groups them
augroup test
 autocmd! ## clear autocommand group
 autocmd BufWritePre * set number!
 autocmd BufWritePre * set wrap!
augroup END
```
## Events
```bash
FileType python ## once filetype option has been set
## filetypes can be gitcommit, help, markdown, php etc.

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
