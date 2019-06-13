require "pry"
require "csv"
class Article
  attr_reader :description, :title, :url, :id

  def initialize(title,description,url, id)
    @title = title
    @description = description
    @url = url
    @id = id
  end

#should we put all of this in server file instead?
  def self.read_csv(csv_file)
    article_array = []
    id = 1
    CSV.foreach(csv_file, headers:true) do |row|
      hash_row = row.to_h
      article_array << Article.new(
        hash_row['title'],
        hash_row['description'],
        hash_row['url'],
        hash_row['id'] = id.to_s)
      id += 1
    end
    article_array
  end
end
