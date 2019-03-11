# frozen_string_literal: true

# It restricts the instantiation of a class to one single instance
require 'singleton'

class CrawlerService
  include Singleton

  def perform(response_data)
    url = URI.parse(response_data[:data][:long_url])
    response = Net::HTTP.get(url)
    Nokogiri::HTML(response).title 
  end
end