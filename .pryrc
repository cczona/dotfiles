# set primary & secondary prompts
# alternative: use the variables listed in 'rvm info'
rvm_current=%x[rvm current].strip!

Pry.config.prompt =
  [ 
    proc { rvm_current + ' pry> '},
    
    proc {('.' * rvm_current.size) + " pry>  " } 
  ]
#Pry.config.prompt = [ proc { rvm_current + ' pry> ' }, proc { {print '.'} } ]
