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
    params[:tag].split(', ').each do |tag|
      link.tags << (Tag.first(tag: params[:tag]) || Tag.create(tag: tag))
    end
    link.save
    redirect '/links'
  end
  
end
