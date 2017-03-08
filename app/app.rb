ENV['RACK_ENV'] ||= 'development'

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
    link = Link.create(:title => params[:title], :url => params[:url], :time => Time.now)
    tag = Tag.create(:tag => params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
