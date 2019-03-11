# frozen_string_literal: true

require_relative 'base_client'

class BitlyClient < BaseClient
	def service_url
		'https://api-ssl.bitly.com'
	end

	def access_token
		@access_token || ENV.fetch('ACCESS_TOKEN')
	end

	def shorten_url(long_url)
		response = connection.get(shorten_endpoint, longUrl: long_url) do |req|
			req.params['access_token'] = access_token
		end
		OpenStruct.new(success?: true, body: process_response(response))
	rescue Faraday::ClientError => exception
		OpenStruct.new(success?: false, message: 'Bad request', details: exception.to_s)
	end

	def clicks_by_link(link, unit: 'minute', units: 30)
	  response = connection.get(clicks_endpoint, link: link, unit: unit, units: units) do |req|
	    req.params['access_token'] = access_token
	  end
	  OpenStruct.new(success?: true, body: process_response(response))
	rescue Faraday::ClientError => exception
		OpenStruct.new(success?: false, message: 'Bad request', details: exception.to_s)
	end

	def lookup_url(long_url)
		response = connection.get(lookup_endpoint, url: long_url) do |req|
			req.params['access_token'] = access_token
		end
	  OpenStruct.new(success?: true, body: process_response(response))
	rescue Faraday::ClientError => exception
		OpenStruct.new(success?: false, message: 'Bad request', details: exception.to_s)
	end
	
	private

	# Bitly's End-points list

	def shorten_endpoint
		'/v3/shorten'
	end

	def clicks_endpoint
		'/v3/link/clicks'
	end

	def lookup_endpoint
		'/v3/link/lookup'
	end
end