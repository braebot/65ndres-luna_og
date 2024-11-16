class UrlsController < ApplicationController
  def index
    @url = Url.new

    @urls = Url.all
  end

  def create
    puts "Hope fully thi sis the Things #{params}"
    url = Url.new(url_params)
    if url.save
      puts "yay it was saved"
    else
    end
  end


  def fetch_meta_tags(url)
    begin
      document  = Nokogiri::HTML(URI.open(url))
      meta_tags = document.css("meta[property*='og']")
    rescue => e
      puts "An error occurred: #{e.message}"
    end
  end


  private

  def url_params
    params.require("url").permit("text")
  end


end