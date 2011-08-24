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


## /REMINDERS ##

##set prompt color
# 30=>black
# 31=>red
# 32=>green
# 33=>yellow
# 34=>blue
# 35=>purple
# 36=>cyan

color=36 #default

if [[ $HOSTNAME = 'Lovers-Walk.local' ]]; then
	color=31
elif [[ $USER = 'cczona' ]]; then
	color=34
elif [[ $USER = 'uufsc' ]]; then
	color=35
elif [[ $USER = 'sansum' ]]; then
	color=32
fi


## include files; next-to-last so they override defaults set above
source ~/.bash_profile_for_all
if [[ $OSTYPE =~ 'darwin' ]]; then
	source ~/.bash_profile_for_mac
elif [[ $OSTYPE =~ 'ubuntu' ]]; then
	source ~/.bash_profile_for_ubuntu 
if