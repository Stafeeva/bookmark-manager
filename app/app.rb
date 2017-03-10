ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/data_mapper_setup'

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
    tag  = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @link = tag ? tag.links : []
    erb :links
  end

  run! if app_file == $0
end
