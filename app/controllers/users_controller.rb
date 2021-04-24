
class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/user/#{current_user.slug}"
    else
      erb :'/users/signup'
    end
  end
end