class BookmarkManager < Sinatra::Base

  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'here lie cats'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :parital_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
