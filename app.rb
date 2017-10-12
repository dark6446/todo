require 'rubygems'
require 'sinatra'
require 'data_mapper'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/dev.db")

class Article
  include DataMapper::Resource

  property :id,Serial
  property :title,String
  property :content,Text
end
DataMapper.finalize.auto_upgrade!

# get '/' do
#   erb :index
# end

get '/' do
  @article = Article.all
  erb :'tdo/index'

end

# get '/tdo/new' do
#   erb :'tdo/new'
# end
#
# get '/tdo/:id' do |id|
#   @article = Article.get!(id)
#   erb :'tdo/show'
# end

# get '/tdo/:id/edit' do |id|
#   @article = Article.get!(id)
#   erb :'tdo/edit'
# end

post '/tdo' do
  article = Article.new(params[:article])
  if article.save
    redirect '/'
  else
    redirect '/tdo/new'
  end
end

put '/tdo/:id' do |id|
  # puts "ARTCILE: #{params[:article]}"
  article = Article.get!(id)
  success = article.update(params[:article])

  if success
    # puts "SUCESSS #{article.id}"
    # redirect "/tdo/#{id}"
      redirect '/'
  else
    # puts "FAILED"
    redirect "/tdo/#{id}/edit"
  end
end

delete '/tdo/:id' do |id|
  article = Article.get!(id)
  article.destroy!
  redirect "/"
end
