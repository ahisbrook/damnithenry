require 'sinatra'

class DamnitHenry < Sinatra::Base
  set :show_exceptions, true

  get '/' do
    erb :index
  end

  post '/' do
    puts params
    erb :apology, :locals => {
      :henry_did => params["henry_did"]
    }
  end

end