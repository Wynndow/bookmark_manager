ENV['RACK_ENV']||='development'


require 'sinatra/base'
require_relative 'datamapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'here lie cats'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  get '/links' do
    @links = Link.all
    erb :'links/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    params[:tag].split(', ').each do |tag|
      link.tags << (Tag.first(tag: params[:tag]) || Tag.create(tag: tag))
    end
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    tag = Tag.first(tag: params[:tag])
    @links = tag ? tag.links : []
    erb :'links/links'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_conf])
    user.save
    session[:user_id] = user.id
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
