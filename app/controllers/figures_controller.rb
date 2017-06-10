class FiguresController < ApplicationController

  get '/figures' do

    erb :"figures/index"
  end

  get '/figures/new' do

    erb :"figures/new"
  end

  post '/figures' do

    @figure = Figure.new(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    if @figure = Figure.find_by(:id => params[:id])
      erb :"figures/show"
    end
  end

  get '/figures/:id/edit' do
    if @figure = Figure.find_by(:id => params[:id])
      erb :"figures/edit"
    end
  end

  post "/figures/:id" do
    figure = Figure.find_by(id: params[:id])

    figure.update(params[:figure]) if !params[:figure][:name].empty?
    figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    figure.save
    redirect "/figures/#{figure.id}"
  end
end
