require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @link = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    Link.create(:title => params[:title], :url => params[:url], :time => Time.now)
    redirect '/links'
  end

  run! if app_file == $0
end
