
class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/vinyls"
    else
      erb :"/users/signup"
    end
  end

  post '/signup' do
    user = User.new(username: params[:username], password: params[:password])
    if user.username.blank? || user.password.blank? || User.find_by_username(params[:username])
        redirect '/signup'
    else
      user.save
      session[:user_id] = user.id
      redirect '/login'
    end
  end
  
  
  get '/login' do
      if logged_in?
        redirect "/vinyls"
      else
        erb :"/users/login"
    end
  end

  post '/login' do
    user = User.find_by_username(params[:username])
    if user && user.athenticate(params[:password])
      session[:user_id] = user.id
      redirect '/vinyls'
    else
      erb :failure
    end
  end

  get '/logout' do
    session.clear
    erb :welcome
  end

end