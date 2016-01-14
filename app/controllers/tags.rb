class BookmarkManager < Sinatra::Base

  get '/tags/:tag' do
    tag = Tag.first(tag: params[:tag])
    @links = tag ? tag.links : []
    erb :'links/links'
  end

end
