require 'pry'
Pry.editor = 'vim'

Pry.config.ls.separator = "\n"
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

Pry.config.history_load = true
Pry.config.history_save = true

begin
  require 'awesome_print'
  require 'looksee'
  require 'json'
  require 'open-uri'
  AwesomePrint.pry!
rescue Exception => e
  puts e.message
end

# Provide access to pbcopy/pbpaste from pry ( works only on OS X )
if RUBY_PLATFORM =~ /darwin/
  def pbcopy(input)
    str = input.to_s
    IO.popen('pbcopy', 'w') { |f| f << str }
    str
  end

  def pbpaste
    `pbpaste`
  end
end
