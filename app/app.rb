require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @link = Link.all
    erb :links
  end

  run! if app_file == $0
end
