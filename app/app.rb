ENV['RACK_ENV']||='development'


require 'sinatra/base'
require_relative 'datamapper_setup'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first(params[:tag]) || Tag.new(tag: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
