
class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/user/#{current_user.slug}"
    else
      erb :'/users/signup', :layout => :"layout/external"
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:password].empty?
      redirect '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect "/user/#{@user.slug}"
    end
  end
  
  get '/login' do
    if logged_in?
      redirect "/user/#{current_user.slug}"
    else
      erb :'/users/login', :layout => :"layout/external"
    end
  end

  get '/user/:user_slug' do
    @user = User.find_by_slug(params[:user_slug])

    if @user.id == session[:user_id]
      @vinyls = Vinyl.where(user_id: current_user.id)
      erb :'users/homepage', :layout => :'layout/layout'
    else
      erb :'/users/error', :'layout/internal'
    end
  end


end