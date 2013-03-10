require "sinatra"
require "slim"
require "nokogiri"
require "open-uri"

set :views, -> { root }

get "/:id" do
  id = params[:id]
  url = "http://www.imdb.com/title/#{id}/trivia"
  doc = Nokogiri::HTML(open(url))

  @title = doc.at("title").text
  @items = doc.search(".sodatext")
  slim :show
end
