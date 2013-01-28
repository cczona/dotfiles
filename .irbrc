require 'rubygems' unless defined? Gem

# colorize return values & format them much more clearly than p/pp
begin
  require 'awesome_print'
  module IRB
    class Irb
      def output_value
        ap @context.last_value
      end
    end
  end
rescue LoadError => err
  warn "#{err}"
end

# Custom prompt. Based on <https://gist.github.com/4652812> by Zachary Scott
# NOTE: when AwesomePrint is active, it ignores :RETURN setting
IRB.conf[:PROMPT][:PERSONAL] = IRB.conf[:PROMPT][:RVM].merge(
  :PROMPT_I =>    "\n#{RUBY_VERSION} >> ",
  :PROMPT_S =>    "%l >> ",
  :PROMPT_C =>    "? >> ",
  :RETURN   =>    "RETURNS> %s\n\n"
)


IRB.conf[:PROMPT][:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# further supplements to AwesomePrint and my custom prompt
begin; require 'brice';                     rescue LoadError => err; warn "#{err}"; end
Brice.init { |config |
  config.include 'colours', 'rails'
  config.exclude 'added_methods', 'prompt'
}

# final decision...
IRB.conf[:PROMPT_MODE] = :PERSONAL


begin; require 'irb/completion';            rescue LoadError => err; warn "#{err}"; end
begin; require 'irb/ext/save-history';      rescue LoadError => err; warn "#{err}"; end
# begin; require 'methodfinder';              rescue LoadError => err; warn "#{err}"; end
# begin; require 'metaid';                    rescue LoadError => err; warn "#{err}"; end


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



