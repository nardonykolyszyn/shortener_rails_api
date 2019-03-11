class LinkJob < ApplicationJob
  queue_as :default

  def perform(response_data)
    response_data[:data][:title] = CrawlerService.instance.perform(response_data)
    link = Link.new(response: response_data)
    link.save if link.valid?
  end
end
