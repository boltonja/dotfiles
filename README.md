# dotfiles
a knapsack of stuff i take everywhere

Installation
1. mkdir -p ~/Documents/Projects/ && cd ~/Documents/Projects
2. git clone git@github.com:boltonja/dotfiles.git 
3. cd ~/Documents/Projects/dotfiles && bin/beachhead

Adding new files to an existing folder:
1. Your canonical file lives in the repo folder, e.g. dotfiles/bin/newscript.sh
2. cd ~/Documents/Projects/dotfiles && bin/beachhead

Adding new dirs, or adding files at the top level:
1. add the file or folder somewhere in the repo
2. add the path to the file ~/Documents/Projects/dotfiles/manifest
3. (optional) if the item was a dir, perhaps add files to it
4. cd ~/Documents/Projects/dotfiles && bin/beachhead

Brief Overview

./manifest - meta-list of symlinks for bin/beachhead to create
./.emacs.d/viper - configures VIper, a Package for Emacs Rebels and a venemous VI PERil.
./.config/fish/config.fish - unmaintained port of .bashrc to fish
./.config/fish/fish_variables - theoretically fish saves variables here
./.bashrc - contains aliases and setup for path, prompt, and other things, notably an alias for fix.sh
./elisp/xcscope.el/README.org - i got tired of having to download this separately, should probably add a refresh/fetch to beachhead
./elisp/xcscope.el/xcscope.el - ditto
./bin/csinit - initializes a cscope file in a folder previously selected by fix.sh
./bin/mkgallery.sh - generates a static web gallery from a tree of image files
./bin/agent.fish - unmaintained port of agent.sh to fish
./bin/repocmp - if pwd is a git repo, compare the contents to some other arbitrary folder
./bin/fix.sh - sets up some shell environment variables and/or aliases for working with a top-level project folder under ~/Documents/Projects, must be source'd, see .bashrc for the alias that invokes this
./bin/beachhead - generate symlinks in $HOME for everything in this repo
./bin/htmlify3.sh - generates html for a tree of image files, see mkgallery.sh
./bin/compose.sh - set compose to right-alt in gnome
./bin/spacemacs - invoke spacemacs, if installed
./bin/chtit - set the terminal hardware status or emulator window title to an arbitrary string
./bin/agent.sh - starts an ssh-agent or attaches to an existing agent, must be source'd, see .bashrc for alias
./bin/thumbify.sh - generates thumbnails in a tree of image files, see mkgallery.sh
./bin/fix.fish - unmaintained port of fix.sh to fish
./bin/jera.sh - displays a rune in 9 lines of ascii art
./bin/repolist - apparently an unreferenced duplicate of manifest
./bin/filepids.sh - a poor substitute for lsof
./.bash_profile - sources .bashrc
./.emacs - initializes stock emacs
./themes/konsole/IC_Orange_PPL.colorscheme - puts this where Konsole can find it if this is a KDE system

Development Tools
"fix" et. al. are the last vestiges from some previous working environment.  Usage is roughly as follows:

- fix foo  # selects ~/Documents/Projects/foo, sets some environment variables used by prompt, chtit, and other scripts
- cd $WORK # cwd to ~/Documents/Projects
- cd $SRC  # cwd to ~/Documents/Projects/foo
- csinit   # cwd to ~/Documents/Projects/foo and initialize cscope there


