require 'rubygems'
require 'utility_belt'
require 'irb/completion'
require 'irb/ext/save-history'

# call stuff like "my_obj.what? 3" to find out which my_obj methods return 3 as their result
# in theory; but calling it locks up irb under UtilityBelt 1.1.0
#require 'what_methods'

# pretty print
require 'pp'

# indent blocks etc for easier reading
IRB.conf[:AUTO_INDENT]=true

#
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

## this option currently throws errors under UtilityBelt 1.1.0
#UtilityBelt::Themes.background(:light)

print "\n~/.irbrc loaded successfully\n\n"

