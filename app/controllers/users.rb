class BookmarkManager < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    user = User.new(username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_conf])
    if user.save
      session[:user_id] = user.id
      redirect '/links'
    else
      flash.now[:errors] = user.errors.full_messages
      @user = user
      erb :'users/new'
    end
  end

  get '/users/recover' do
    erb :'users/recover'
  end

  post '/users/recover' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
    end
    redirect '/users/acknowledgment'
  end

  get '/users/acknowledgment' do
    erb :'users/acknowledgment'
  end

  get '/users/reset_password' do
    'Sorry, your token has expired'
  end

end