require 'open-uri'

class UrlsController < ApplicationController
  def index
    @url = Url.new

    @urls = Url.order(created_at: :desc)
  end

  def create
    puts "Hope fully thi sis the Things #{params}"
    url = Url.new(url_params)
    if url.save
      redirect_to urls_path
    else
    end
  end

  private

  def url_params
    params.require("url").permit("text")
  end


end