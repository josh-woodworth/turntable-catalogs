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

  post '/vinyls' do
    @vinyl = Vinyl.new(params)
    @vinyl.user_id = current_user.id
    
    if @vinyl.save
      current_user.vinyls << @vinyl
      redirect "/vinyls/#{vinly.id}"
    else
      redirect '/vinyls/new'
    end
  end
  
  get '/vinyls/new' do
    erb :"vinyls/new"
  end

  get '/vinyls/:id/edit' do
    if logged_in?
      @vinyl = current_user.vinyls.find_by(params)
      if @vinyl
        erb :'vinyls/edit'
      else
        redirect '/vinyls'
      end
    else
      redirect '/login'
    end
  end

  patch '/vinyls/:id' do
    vinyl = current_user.vinyls.find_by(id: params[:id])
    if vinyl.update(title: params[:title], artist: params[:artist], genre: params[:genre], release_year: params[:release_year])
        redirect "/vinyls/#{vinyl.id}"
    else
        redirect "/vinyls/#{vinyl.id}/edit"
    end
  end

  get '/vinyl/:id' do
    if logged_in?
      @vinyl = current_user.vinlys.find_by(id: params[:id])
      if @vinyl
        erb :'vinyls/show'
      else
        redirect '/vinyls'
      end
    else redirect '/login'
    end
  end

  delete '/vinyls/:id' do
    if logged_in?
        @vinyl = current_user.vinyls.find_by(id: params[:id])
        if  @vinyl
            @vinyl.delete
        end
        redirect '/vinyls'
    else
        redirect '/login'
    end
end


end