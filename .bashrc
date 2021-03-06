## REMINDERS  ##
#
# cd -        switch to last path (or do it repeatedly to switch back and forth between 2 paths)
# !!          redo the last command
# sudo !!     redo the last command, but this time sudo it
# nano +N     (where N is a number) open the document at that line number, ie. 'nano +200'
# $           (then double-tab) list environment variables
# @           (then double-tab) list hostnames
# ~           (then double-tab) list usernames
#
# man -k term | grep "\([15]\)"       search all manpages for a keyword


# IMPORTANT: 'set -o optionname' == 'enable'; 'set +o optionname' == 'disable
# see 'set -o' on its own to list all current settings
set -o ignoreeof # exit shell only by using 'exit', not ^D
set -o emacs # use bindings such as  ^A, ^E, ^W

# set Backspace & Delete keys to default functionality
stty ek

# start each login with a random pithy little something
# motd == "message of the day"
# NOTE: -a flag brings in stuff from the databases labeled offensive
#fortune -a

#custom prompt
 BLACK="\e[30m"
   RED="\e[31m"
 GREEN="\e[32m"
YELLOW="\e[33m"
  BLUE="\e[34m"
PURPLE="\e[35m"
  CYAN="\e[36m"
 WHITE="\e[37m"

COLOR=$BLACK #default
if [[ $HOSTNAME =~ '.local' ]]; then COLOR=$BLACK
elif [[ $HOSTNAME =~ 'joyent.us' ]]; then COLOR=$PURPLE
fi

source ~/.git_prompt_additions

function git_dirty {
  git status -s  2>/dev/null | sed /^#/d | wc -l | tr -d ' '
}

function git_branch_name {
  git branch| grep "^\* "| cut -f 2-100 -d ' '
}

function git_repo {
  basename $(git rev-parse --show-toplevel)
}

# shell prompt with RVM and Git info
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_DESCRIBE_STYLE=true
PS1="\
\\n\\n\
$YELLOW\
\$(git_repo) \
#\
\$(git_branch_name) \
$CYAN\
\$(git_dirty) \
\$(git_ps1ccz) \
$BLACK \
\$(~/.rvm/bin/rvm-prompt v p g s)\
\\n\
[\w] \
"

# secondary (continuation) prompt
PS2="⇲ "

# use GitHub's 'hub', aliased to 'git' so that 'git <blah>' calls 'hub <blah>' as necessary
if [ `command -v hub` ]; then
  eval "$(hub alias -s)"
fi

# use same timezone everywhere
TZ=America/Los_Angeles

# color scheme used by 'ls'
LSCOLORS=Exgxdxdxbxdxdxaxaxexex

# how many commands to keep in history?
HISTSIZE=5000

# page nicely, please
PAGER="less -MW"
MANPAGER="less -MW"


# erase duplicates from history
HISTCONTROL=erasedups
HISTCONTROL=ignoreboth #for OSs that don't support erasedups
HISTIGNORE="&"

# turn on color for git
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.ui auto

# turn on color for ri (ruby documentation viewer)
RI=" --format ansi"

# optimize git for multiple cores/CPUs
git config --global pack.threads 0

# choose different editor than (default) Pico
EDITOR='nano'
SVN_EDITOR="nano"

#don't timeout, please
TMOUT=0

#set shell options (-s=set/on -u=unset/off)
shopt -s cdspell  #forgive minor typos
shopt -s dotglob #autocomplete paths that start with "."
shopt -s nocaseglob #case insensitive autocomplete
shopt -s cdable_vars #use 'foo=bar' to create a cd-able variable called foo, whose value is bar (i.e shortcut to 'cd bar')
shopt -s histappend #retain history across multiple, possibly concurrent, terminal sessions

# aliases
alias cp="cp -i"
alias crontab="crontab -e"
alias du="du -hs"
alias findme="find /[bcdehlrstuvw]* -name"
alias gemq="gem query --details --both --all --name-matches"
alias grep="grep -E --color"
alias logs="cd /private/var/log/"
alias ls="ls -AphG"
alias ll="ls -AlphG"
alias more="less -MW"
alias mv="mv -i"
alias mysql="mysql -u root -p"
alias mysqldump="mysqldump -u root -p"
alias mysqlimport="mysqlimport -u root -p"
alias nslookup="dig" #nslookup is deprecated and buggy
alias pico="nano"
alias ps="ps -x"
alias qri="qri -O eEnNpPxXfFaAmM"
alias rm="rm -i"
alias rmrec="rm -r"
alias rpg="pwgen -Bcnsy1 18"
alias scp="scp -r"
alias top="top -ocpu -O+rsize -s 5" # -t flag is not cross-platform

alias rakeT="((rake -P | grep rake) && rake -T) | sort"

alias b="bundle"
alias be="bundle exec"

complete -o default -o nospace -F _git g # enable autocompletions to work on "g" alias
alias g="git"
alias gf="git flow"
alias gff="git flow feature"

alias h="heroku"

alias r="rvm"
alias rg="rvm gemset"
alias rgc="rvm gemset create"
alias rgl="rvm gemset list"
alias rgu="rvm gemset use"
alias ru="rvm use"
alias ru1="rvm use 1.9.1"
alias ru2="rvm use 1.9.2"
alias ru3="rvm use 1.9.3"
alias ri="ri -i"

alias m="subl"
alias s="subl"
alias mate="subl"

alias rdb="RAILS_ENV=development bundle exec rake db:drop db:migrate db:seed"
alias rdbt="RAILS_ENV=test         bundle exec rake db:drop db:migrate db:seed"

# add to Git aliases
eval "$(hub alias -s)"

# NOTE: see also http://www.markhneedham.com/blog/2008/10/15/browsing-around-the-unix-shell-more-easily/


## Set prompt color
# 30=>black
# 31=>red
# 32=>green
# 33=>yellow
# 34=>blue
# 35=>purple
# 36=>cyan
##

## include files; doing this last to ensure they override defaults set above
if [[ $OSTYPE =~ 'darwin' ]] && [ -f ~/.bashrcmac ]; then
    source ~/.bashrcmac
elif [[ $OSTYPE =~ 'ubuntu' || $OSTYPE =~ 'linux' ]] && [ -f ~/.bashrcubuntu ]; then
    source ~/.bashrcubuntu
elif [[ $OSTYPE =~ 'hpux' ]] && [ -f ~/.bashrchpux]; then
    source ~/.bashrchpux
fi


# "Ensure that RVM is sourced after any path settings as RVM manipulates the path. If you don't do this, RVM may not work as expected." <http://beginrescueend.com/rvm/install/>
if [[ -d ~/.rvm/ ]]; then
  source ~/.bashrcrvm
fi

#directories for cd to look into for path autocompletions
#ie. 'cd mys' instead of 'cd ~/Sites/my-site/trunk'
CDPATH=$CDPATH:/var/log/httpd:/etc/apache2:/etc/httpd
CDPATH=.:~:$CDPATH
