## REMINDERS  ##
# 
# cd -				switch to last path (or do it repeatedly to switch back and forth between 2 paths)
# !!					redo the last command
# sudo !!			redo the last command, but this time sudo it
# nano +N			(where N is a number)	open the document at that line number, ie. 'nano +200'
# $						(then double-tab) list environment variables
# @						(then double-tab) list hostnames
# ~						(then double-tab) list usernames
# 
# man -k term | grep "\([15]\)"				search all manpages for a keyword


# set Backspace & Delete keys to default functionality
stty ek

# start each login with a random pithy little something
# motd == "message of the day"
# NOTE: -a flag brings in stuff from the databases labeled offensive
fortune -a

#custom prompt; $color is set in .bash_profile
PS1="\\n\e[1;${COLOR}m\]\u@\h \e[${COLOR}m\](\$(~/.rvm/bin/rvm-prompt v g s)) \e[0m\]\\n[\w] "

# use same timezone everywhere
TZ=America/Los_Angeles

# color scheme used by 'ls'
LSCOLORS=Exgxdxdxbxdxdxaxaxexex

# how many commands to keep in history?
HISTSIZE=150

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

#directories for cd to look into for path autocompletions
#ie. 'cd mys' instead of 'cd ~/Sites/my-site/trunk'
CDPATH=.:~:/var/log/httpd

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

COLOR=36 #default
if [[ $HOSTNAME =~ '.local' ]]; then COLOR=30
elif [[ $HOSTNAME =~ 'joyent.us' ]]; then COLOR=32
elif [[ $HOSTNAME =~ 'ccsf.edu' ]]; then COLOR=35
elif [[ $HOSTNAME =~ 'santarosa.edu' ]]; then COLOR=31
elif [[ $HOSTNAME =~ 'csmcis.com' ]]; then COLOR=34
fi


## include files; doing this last to ensure they override defaults set above
if [[ $OSTYPE =~ 'darwin' ]] && [ -f ~/.bashmac ]; then
    source ~/.bashmac
elif [[ $OSTYPE =~ 'ubuntu' || $OSTYPE =~ 'linux' ]] && [ -f ~/.bashubuntu ]; then
    source ~/.bashubuntu 
elif [[ $OSTYPE =~ 'hpux' ]] && [ -f ~/.bashhpux]; then
    source ~/.bashhpux
fi


# "Ensure that RVM is sourced after any path settings as RVM and manipulates the path. If you don't do this, RVM may not work as expected." <http://beginrescueend.com/rvm/install/>
if [[ -d ~/.rvm/ ]]; then
  source ~/.bashrvm
fi