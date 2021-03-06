require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "vinyl_secret"
  end

  get '/' do
    if logged_in?
      redirect "/vinyls"
    else
      erb :'/welcome'
    end
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if logged_in?
    end
  end

end
