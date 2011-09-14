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

## /REMINDERS ##

##set prompt color
# 30=>black
# 31=>red
# 32=>green
# 33=>yellow
# 34=>blue
# 35=>purple
# 36=>cyan

COLOR=36 #default
if [[ $HOSTNAME =~ '.local' ]]; then COLOR=30
elif [[ $HOSTNAME =~ 'joyent.us' ]]; then COLOR=32
elif [[ $HOSTNAME =~ 'ccsf.edu' ]]; then COLOR=35
elif [[ $HOSTNAME =~ 'santarosa.edu' ]]; then COLOR=31
elif [[ $HOSTNAME =~ 'csmcis.com' ]]; then COLOR=34
fi


## include files; next-to-last so they override defaults set above
source ~/.bash_profile_for_all
if [[ $OSTYPE =~ 'darwin' ]]; then
	source ~/.bash_profile_for_mac
elif [[ $OSTYPE =~ 'ubuntu' || $OSTYPE =~ 'linux' ]]; then
    source ~/.bash_profile_for_ubuntu 
elif [[ $OSTYPE =~ 'hpux' ]]; then
    source ~/.bash_profile_for_hpux
fi

# start each login with a random pithy little something
# motd == "message of the day"
# NOTE: -a flag brings in stuff from the databases labeled offensive
fortune -a > /etc/motd

# NOTE: see also http://www.markhneedham.com/blog/2008/10/15/browsing-around-the-unix-shell-more-easily/