class VinylsController < ApplicationController

  get '/vinyls' do
    if logged_in?
      @vinyls = current_user.vinyls.sort{|a, b| a.artist <=> b.artist}
      erb :'vinyls/index'
    else
      redirect '/login'
    end
  end



end