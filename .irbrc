require 'rubygems' unless defined? Gem

# Custom prompt. Based on <https://gist.github.com/4652812> by Zachary Scott
IRB.conf[:PROMPT][:PERSONAL] = IRB.conf[:PROMPT][:RVM].merge(
  :PROMPT_I =>    "\n#{RUBY_VERSION} >> ",
  :PROMPT_S =>    "%l >> ",
  :PROMPT_C =>    "? >> ",
  :RETURN   =>    "RETURNS> %s\n\n"
)
IRB.conf[:PROMPT_MODE] = :PERSONAL


IRB.conf[:PROMPT][:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

begin; require 'irb/completion';            rescue LoadError => err; warn "#{err}"; end
begin; require 'irb/ext/save-history';      rescue LoadError => err; warn "#{err}"; end
begin; require 'pp';                        rescue LoadError => err; warn "#{err}"; end
# begin; require 'wirble';                    Wirble.init; Wirble.colorize; rescue LoadError => err; warn "#{err}"; end
# begin; require 'methodfinder';              rescue LoadError => err; warn "#{err}"; end
# begin; require 'metaid';                    rescue LoadError => err; warn "#{err}"; end

# switch some of the colors used by Wirble
# colors = Wirble::Colorize.colors.merge({
#   :object_class => :light_purple,
#   :class        => :dark_gray,
#   :symbol       => :red,
#   :symbol_prefix=> :blue,
# })
# Wirble::Colorize.colors = colors
# Wirble.init
# Wirble.colorize

# query classes about the methods they contain
class Object
  # from <http://stackoverflow.com/posts/873371/revisions>
  def interesting_methods
    (self.methods - Object.new.methods).sort
  end

  def interesting_methods_pp
    interesting_methods.each {|method| puts method}
    nil
  end

  def instance_methods_pp(boolean=true)
    instance_methods(boolean).each {|method| puts method}
    nil
  end

  # NOTE: Ruby's built-in Method class has more useful stuff like this, such as object.method :methodname, which identifies the class in the inheritance chain which defined the method named

  # MethodFinder.find(someobject, expectedreturnvalue) identifies methods which generate the expectedreturn value when someobject is the receiver.  (See MethodFinder gem documentation for more tricks)
end


# colorize return values & format them much more clearly than p/pp
require 'awesome_print'
module IRB
  class Irb
    def output_value
      ap @context.last_value
    end
  end
end
