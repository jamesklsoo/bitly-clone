get '/'
@urls = Url.last(5)
@urls.reverse
erb :"static/index"
end

post '/urls' do
  @url = Url.new(long_url: params[:long_url])
  if url.save
    redirect "/"
  else
    erb :"static/index"
  end
end

get '/:short_url' do
  @url = Url.find_by(short_url: params[:short_url])
  @url.click_count +=1
  @url.save

  redirect "#{@url.long_url}"
end
