ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/link'
require_relative 'data_mapper_setup'

class Manager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
  Link.create(url: params[:url], title: params[:title])
  redirect to('/links')
end

post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
    link.tags << Tag.create(name: tag)
  end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb :'links/index'
end

end