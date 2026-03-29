# Bash vim mode
```bash
set -o vi ## switch to vim mode in bash

## change vim mode commands in .inputrc
set editing-mode vi ## set the default editing mode to vi
set keymap vi-command ## set the default keymap to vi-command mode
jj: vi-movement-mode ## bind the jj sequence to switch to vi movement mode
```
# Help
```bash
help {command} | only ## open help fullscreen
CTRL-] ## jump to a subject
vim --version ## get version of vim installed
```
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

set numberwidth=4 ## set option with value
set number numberwidth=4 ## set multiple options at the same time

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
# Echo
```bash
echo 'message' ## echo a message
echomsg 'message' ## echo a message that remains in the message-history
messages ## show message-history
```
# Mapping
```bash
map v dd ## make the v key do dd
map v ## print user mapping for v

map <space> dd ## special characters
map <CR> dd ## enter key
map <c-d> dd ## ctrl key
map <m-d> dd ## alt key
map <s-tab> dd ## shift key

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

## leader key
let mapleader=' ' ## set space as leader key
let maplocalleader='g' ## set g as local leader key
## alternative leader key that can be used in specific file types and make no conflict with global leader key
nnoremap <leader>d d10j ## map a command with the leader key
```
# Source
source $MYVIMRC ## run file content
# Abbreviations
```bash
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
```
# Autocommands
## Syntax
```bash
## autocommands run commands when certain events happen
autocmd <event> <pattern> <command> ## set autocommand rule
autocmd BufNewFile

autocmd ## print active rules
autocmd <event> ## print active rules for a specific event
autocmd <event> <pattern> ## print active rules for a specific event and a specific filter

autocmd BufWritePre * :normal gg=G ## before saving any file, indent it automatically
autocmd BufWritePost *.txt :echo 'File saved successfully' ## filter pattern, command works only on .txt files

autocmd BufReadPost,BufNewFile * :normal OHere is your file ! ## multiple events can trigger the command
autocmd BufReadPost *.html,*.js :normal OHere is your html or js file ! ## multiple filter patterns

autocmd FileType python nnoremap <buffer> <localleader>c I//<esc> ## automatic comment addition only for python files
set filetype? ## print buffer's detected filetype
set filetype=python ## set buffer's filetype
autocmd filetype python ## list set filetype autocommands
```
## Groups
```bash
## autocommand rules are duplicated each time their events are triggered or when vimrc is sourced: the same are added instead of replacing them
## groups can be cleared with autocmd!, so previous commands in the same group are deleted
augroup <groupname>
 autocmd! ## clear autocommand group
 autocmd BufLeave * :echo 'Hello,'
 autocmd BufLeave * :echo 'World!'
augroup END
```
## Events
```bash
FileType ## when buffer filetype is set by vim

BufNewFile ## when is opened a buffer with a new file
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
# Macros
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
# Registers
'ay$ ## in register 'a', copy till end of line
'ap ## from register 'a', paste text
# Windows
## vim command-line window
q: ## q: in normal mode allows editing history in vim mode
# Repeat
. ## repeat the previous action
; ## repeat the previous f/F/t/T action
, ## repeat the previous f/F/t/T action in reverse
# Increment
c-a ## increment by 1 next number
c-x ## decrement by 1 next number
5c-a ## increment by 5
# Case
gUmotion ## make uppercase
gu<motion> ## make lowercase
u ## in visual mode, make selected text lowercase
U ## in visual mode, make selected text uppercase
# Read
read ## insert content from outsite
read file ## insert content of a file
read !command ## insert output of a command
# Autocompletion
c-n ## next match
c-p ## previous match
c-x ## accept selection
c-x c-f ## auto complete file path
c-x c-l ## auto complete line
# Fold
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
# Save
write ## save
quit ## quit
wq ## save and quit
q! ## quit without saving
ZZ ## save and quit
ZQ ## quit without saving
# Swapping letters
xp ## cut letter and paste it after next one
# Surround plugin
cs'' ## change surround ' to '
ysiw' ## you surround inner word with '
ds' ## delete surround '
# Motions
2 ## go line 2
2p ## go to line 2

e ## go end of word
E ## go enf of WORD

w ## go begging of word
W ## go begging of WORD

b ## go beginning of previous word
B ## go beginning of previous WORD

^ ## go beginning of line
$ ## go end of line
# Easymotion
<leader><leader>s ## easymotion
<leader><leader>j ## to line below
<leader><leader>k ## to line above
4j ## four lines down
4k ## four lines up
4h ## four characters left
4l ## four characters right
4G ## go line 4
# Next occurrence
```bash
* ## go to next identical word
# ## go to previous identical word
```
# Reg 
## buffer of previously yanked or copied text
# Rod13
g? ## 13 letters offset to encrypt text
# Marks
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
# Buffers
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
# Ex commands
## substitution
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
# Visual mode
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
# Syntax
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
# Colors
## highlight defines text style and assigns it to a group

highlight ## print all groups with their attributes
highlight pmenu ## print one group

highlight pmenu ctermfg=blue ## set attributes for existing highlight group
highlight MyHighlightGroup cterm=italic ## set new highlight group

highlight link MySyntaxGroup MyHighlightGroup ## link syntax group to a highlight group with a different name

## attributes

ctermg ## background color
ctermfg ## foreground color
cterm ## text-style attributes: bold, italic, underline, reverse (colors)

## groups

Normal ## basic text
NonText ## empty lines

## gutter
LineNr ## line numbers colum
SignColumn ## Errors colums

## xtermcolors

## system colors
black, red, green, yellow, blue, magenta, cyan, white, gray ## plain text colors
0 ## Black
1 ## Maroon
2 ## Green
3 ## Olive
4 ## Navy
5 ## Purple
6 ## Teal
7 ## Silver
8 ## Grey
9 ## Red
10 ## Lime
11 ## Yellow
12 ## Blue
13 ## Fuchsia
14 ## Aqua
15 ## White
## non-system colors
16-255 ## shades of colors
none ## transparency
# Interact through command line
## normal command to interact as in normal mode through command line - from autocommands or from outside vim
normal G ## go last line
normal iblop ## go insert mode, write blop
normal viw ## go visual mode, select inside word
normal :w ## impossible to use command-line mode through normal command
normal /pattern ## impossible to use command-line mode through normal command
normal! ## ignore custom mappings

1,10normal A; ## interact with multiple lines
%normal A; ## interact with whole file
g/pattern/normal A; ## interact with matching pattern

/blop ## search
/ ## in normal mode, typing / goes directly to search mode, which is command-line but erverything begins automatically by /

%s/pattern/replacement/gc ## ex commands
# Interact while outside of vim
## vim -c put you in vim in command-line mode - all interactions from command line is so valid
vim -c 'normal iblop' ## do command through command line (and stay in vim)
vim -c 'normal Gocrac' -c 'wq' file ## chain commands, finish getting out of vim
vim -c '/pattern' file ## search in file
