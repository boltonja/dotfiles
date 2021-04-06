alias fix='. ~/bin/fix.sh'
alias agent='. ~/bin/agent.sh'
PROMPT_COMMAND='chtit; MRR=`basename ${FIX:=none}|sed s/.*\\\\///`; PS1="\u@\h ($MRR):\W% "'
set -o vi
export EDITOR="emacs -nw"
export PATH=$PATH:~/bin
if [ -d $HOME/.dotnet/tools ]
then
	export PATH=$PATH:$HOME/.dotnet/tools
fi
tty -s
if [ $? == 0 ]
then
	jera.sh
fi
if [ -f $HOME/.cargo/env ]
then
    source "$HOME/.cargo/env"
fi
