class LandmarksController < ApplicationController


  get '/landmarks' do
    erb :"landmarks/index"
  end

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id' do
    if @landmark = Landmark.find_by(:id => params[:id])
      erb :"landmarks/show"
    end
  end

  get '/landmarks/:id/edit' do
    if @landmark = Landmark.find_by(:id => params[:id])
      erb :"landmarks/edit"
    end
  end

  post '/landmarks/:id' do
    landmark = Landmark.find_by(:id => params[:id])
    landmark.update(params[:landmark])
    redirect "/landmarks/#{landmark.id}"
  end


end
