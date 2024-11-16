class UrlsController < ApplicationController
  def index
    @url = Url.new
  end

  def create
    puts "Hope fully thi sis the Things #{params}"
  end


  def fetch_meta_tags(url)
    begin
      document = Nokogiri::HTML(URI.open(url))
      meta_tags = document.css("meta[property*='og']")
    rescue => e
      puts "An error occurred: #{e.message}"
    end
  end


end