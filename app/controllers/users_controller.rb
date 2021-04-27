
class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/vinyls"
    else
      erb :"/users/signup"
    end
  end

  post '/signup' do
    @user = User.create(:username => params[:username], :password => params[:password])
      
    if user.save
        redirect '/login'
    else
        redirect '/signup'
    end
  end
  
  
  get '/login' do
    if logged_in?
      redirect "/vinyls"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    user = find_by(:username => params[:username])

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