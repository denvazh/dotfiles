# irb completion
require 'irb/completion'

# irb history
require 'irb/ext/save-history'

# history configuration
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

# use pry
begin
  require 'pry'
  Pry.start
  exit
rescue LoadError => err
  puts "Pry wasn't installed"
end

