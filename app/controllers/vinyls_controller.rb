class VinylsController < ApplicationController

  get '/vinyls' do
    if logged_in?
      @vinyls = Vinyl.all
      @vinyls = @vinyls.sort_by{|v| v.artist}
      erb :'vinyls/index'
    else
      redirect '/login'
    end
  end

  get '/vinyls/new' do
    erb :"vinyls/new"
end

  post '/vinyls' do
    @vinyl = Vinyl.new(params)
    @vinyl.user_id = current_user.id

    if @vinyl.save
      current_user.vinyls << @vinyl
      redirect "/vinyls/#{vinly.id}"
    else
      redirect '/albums/new'
    end
  end



end