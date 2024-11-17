require 'open-uri'

class Url < ApplicationRecord

  after_create :enque_job
  enum status: {"pending": 0, "completed": 1}

  def enque_job
    self.fetch_meta_tags
  end

  def fetch_meta_tags
    begin
      document  = Nokogiri::HTML(URI.open(self.text))
      ["title", "image", "site_name", "description"].each do |attr|
        element = document.css("meta[property='og:#{attr}']")
        self.send(attr+"=", element.first ? element.first["content"] : nil) 
      end

      self.status = :completed
      self.save
    rescue => e
      puts "An error occurred: #{e.message}"
    end
  end
  handle_asynchronously :fetch_meta_tags

  def hostname
    URI(self.text).hostname.gsub("www.", "").upcase
  end
end
