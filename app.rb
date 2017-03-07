require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect('/links')
  end

  run! if app_file == $0
end
