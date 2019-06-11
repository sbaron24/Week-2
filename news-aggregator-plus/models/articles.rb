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
    # csv_objects = CSV.readlines('articles.csv', headers: true)
    #
    # csv_objects.each do |csv_object|
    #   article_array << Article.new(csv_object[:title],csv_object[:description],csv_object[:url])
    # end
    # binding.pry
    CSV.foreach(csv_file, headers:true) do |row|
      binding.pry
      hash_row = row.to_h
      article_array << Article.new(hash_row['title'],hash_row['description'],hash_row['url'])
    end
#    binding.pry

    return article_array
  end
end
