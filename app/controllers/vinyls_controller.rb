class VinylsController < ApplicationController

  get '/vinyls' do
    if logged_in?
      @vinyls = current_user.vinyls.sort{|a, b| a.artist <=> b.artist}
      erb :'vinyls/index'
    else
      redirect '/login'
    end
  end

  post '/vinyls' do
    vinyl = current_user.vinyls.build(params)
    if vinyl.save
      redirect "/vinyls/#{vinly.id}"
    else
      redirect '/albums/new'
    end
  end



end