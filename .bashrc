alias fix='. ~/bin/fix.sh'
alias agent='. ~/bin/agent.sh'
PROMPT_COMMAND='chtit; MRR=`basename ${FIX:=none}|sed s/.*\\\\///`; PS1="\u@\h ($MRR):\W% "'
set -o vi
export EDITOR=emacs
export PATH=$PATH:~/bin
