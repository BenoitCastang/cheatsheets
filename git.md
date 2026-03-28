# Repo management
```bash
git init ## make the current directory a git repository
.git/config ## repo config file
```
# Status
```bash
git status [file] ## show changes
git diff ## display changes
git diff <file> ## display changes of a particular file
git log ## display list of commits
git log --oneline ## short display
git lp ## log with all details
```
# Commit
```bash
git add <file> ## add files to the repo
git add . ## add every files in working directory
git add -u ## update all files throughout the project, including deletions
git add -u path ## update only path
git commit ## make a commit
git commit -m "message" ## make a commit with message
git commit -a ## add files then commit
git stash ## drop local changes
git revert ##
git revert <hash> ## hash from git log --oneline
```
# Branch management
```bash
git branch ## list branches in local repository
git checkout master  ## switch to a branch
git checkout -b master ## create branch
git branch -d master ## delete branch
```
# Github
```bash
git clone url.git ## download a public repository
git pull url.git ## download the changes

## Create a repository on Github
git remote add origin url.git ## change origin in .git/config
## Pushing code to a remote repositoty needs setting up an access token
## On Github: Profile icon -> Settings -> Developer settings -> Personal access tokens -> Generate new token
git push origin master ## push the repo to github, asked credentials : connect with Github username as username and Github access token as a password
```
# Config
```bash
~/.gitconfig ## git config file

git config --global user.name ## set git username
git config --global user.email ## set git email

git config --global core.editor = "nvim" ## set git editor

git config --global credential.helper cache ## store credentials until system restart
git config --global credential.helper store ## store credentials permanently
```
