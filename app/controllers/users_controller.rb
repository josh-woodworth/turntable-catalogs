
class UsersController < ApplicationController

  # get '/signup' do
  #   if logged_in?
  #     redirect "/user/#{current_user.slug}"
  #   else
  #     erb :'/users/signup', :layout => :"layout/external"
  #   end
  # end

  # post '/signup' do
  #   if params[:username].empty? || params[:password].empty?
  #     redirect '/signup'
  #   else
  #     @user = User.create(:username => params[:username], :password => params[:password])
  #     session[:user_id] = @user.id
  #     redirect "/user/#{@user.slug}"
  #   end
  # end
  
  # get '/login' do
  #   if logged_in?
  #     redirect "/user/#{current_user.slug}"
  #   else
  #     erb :'/users/login', :layout => :"layout/external"
  #   end
  # end

end