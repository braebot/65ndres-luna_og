require 'open-uri'

class UrlsController < ApplicationController
  def index
    @url  = Url.new
    @urls = Url.order(created_at: :desc)
  end

  def create
    url = Url.new(url_params)
    if url.save
      redirect_to urls_path
    end
  end

  def destroy
    url = Url.find(params["id"])
    url.delete
    redirect_to urls_path
  end

  private

  def url_params
    params.require("url").permit("text")
  end
end