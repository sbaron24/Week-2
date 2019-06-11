require "pry"
require "csv"
class Article
  attr_reader :description, :title, :url

  def initialize(title,description,url)
    @title = title
    @description = description
    @url = url
  end

#should we put all of this in server file instead?
  def self.read_csv(csv_file)
    article_array = []
    CSV.foreach(csv_file, headers:true) do |row|
      hash_row = row.to_h
      article_array << Article.new(hash_row['title'],hash_row['description'],hash_row['url'])
    end
    article_array
  end
end
