require "sinatra"
require "pry" if development? || test?
require_relative "models/articles"
require "csv"

set :bind, '0.0.0.0'  # bind to all interfaces



get '/' do
  redirect '/articles'
end

get '/articles' do
  # @articles = Article.read_csv("data/articles.csv")
  @articles = Article.read_csv(csv_file)
  erb :index
end

get '/articles/new' do
  erb :new
end

post '/articles/new' do
  title = params["title"]
  description = params["description"]
  url = params["url"]
  @error = nil
  if title != "" && description != "" && url != ""
    binding.pry
    CSV.open(csv_file, "a", headers: true) do |csv|
      csv << [title, description, url]
    end
    redirect '/'
  else
    @error = "Please complete all fields!"
  end
  erb :new
end

def csv_file
  if ENV["RACK_ENV"] == "test"
    "data/test_articles.csv"
  else
    "data/articles.csv"
  end
end

def reset_csv
  CSV.open(csv_file, "w", headers: true) do |csv|
    csv << ["title", "description", "url"]
    csv << ["A Deep Dive into Routing and Controller Dispatch in Rails",
            "How does a web request accepted by Rack make it all the way to your Rails controller? Let's find out!",
            "https://medium.com/rubyinside/a-deep-dive-into-routing-and-controller-dispatch-in-rails-8bf58c2cf3b5"]
  end
end
