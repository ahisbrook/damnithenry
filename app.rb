require 'sinatra'

lib_path = File.expand_path('../lib', __FILE__)
require "#{lib_path}/input_parser"

class DamnitHenry < Sinatra::Base
  set :show_exceptions, true

  get '/' do
    erb :index, :locals => {
      :apology_visibility => 'hidden',
      :henry_did_what => params["henryDidWhat"]
    }
  end

  post '/' do
    puts params
    input_parser = InputParser.new
    erb :index, :locals => {
      :apology_visibility => 'visible',
      :henry_did_what => params["henryDidWhat"]
    }
  end
end