require "sinatra"
require "pry" if development? || test?
require_relative "models/articles"

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/articles'
end

get '/articles' do
  @articles = Article.read_csv("data/articles.csv")
  erb :index
end

# post '/articles/new' do
#   @error = "Please fill out all fields"
#
#   if title != "" && description != "" && url != ""
#     @articles << Article.new(title,description,url)
#   else
#     @error
#   end
#     redirect '/articles/new'
# end
