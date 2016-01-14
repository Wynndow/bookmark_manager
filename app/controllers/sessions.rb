class BookmarkManager < Sinatra::Base

  get '/session/new' do
    erb :'session/new'
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/links')
    else
      flash.now[:errors] = ["Incorrect username or password"]
      erb :'session/new'
    end
  end

  delete '/session' do
    @user = User.get(session[:user_id])
    session[:user_id] = nil
    flash.next[:notice] = "Goodbye"
    redirect('/links')
  end

end
