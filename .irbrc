require 'rubygems' unless defined? Gem

# indent blocks etc for easier reading
IRB.conf[:AUTO_INDENT]=true

ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

begin; require 'irb/completion';            rescue LoadError => err; warn "#{err}"; end
begin; require 'irb/ext/save-history';      rescue LoadError => err; warn "#{err}"; end
begin; require 'pp';                        rescue LoadError => err; warn "#{err}"; end
begin; require 'wirble';                    Wirble.init; Wirble.colorize; rescue LoadError => err; warn "#{err}"; end
begin; require 'methodfinder';              rescue LoadError => err; warn "#{err}"; end
begin; require 'metaid';                    rescue LoadError => err; warn "#{err}"; end

# switch some of the colors used by Wirble
colors = Wirble::Colorize.colors.merge({
  :object_class => :light_purple,
  :class        => :dark_gray,
  :symbol       => :red,
  :symbol_prefix=> :blue,
})
Wirble::Colorize.colors = colors
Wirble.init
Wirble.colorize

  # MethodFinder.find(someobject, expectedreturnvalue) identifies methods which generate the expectedreturn value when someobject is the receiver.  (See MethodFinder gem documentation for more tricks)
end
