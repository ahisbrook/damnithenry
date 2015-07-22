require 'sinatra'
require 'twitter'

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
    twitter.update("#{apology} -- via damnithenry.com")
    erb :index, :locals => {
      :apology_visibility => 'visible',
      :apology => apology
    }
  end

  private

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end
end