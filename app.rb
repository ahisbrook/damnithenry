require 'sinatra'

class DamnitHenry < Sinatra::Base
  set :show_exceptions, true

  get '/' do
    "Damnit Henry! (╯°□°）╯︵ ┻━┻"
  end
end