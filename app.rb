require 'sinatra'

lib_path = File.expand_path('../lib', __FILE__)
require "#{lib_path}/apology_generator"

class DamnitHenry < Sinatra::Base
  set :show_exceptions, true

  get '/' do
    apology = ApologyGenerator.new.generate(params["henryDidWhat"])
    erb :index, :locals => {
      :apology_visibility => 'hidden',
      :apology => apology
    }
  end

  post '/' do
    apology = ApologyGenerator.new.generate(params["henryDidWhat"])
    erb :index, :locals => {
      :apology_visibility => 'visible',
      :apology => apology
    }
  end
end