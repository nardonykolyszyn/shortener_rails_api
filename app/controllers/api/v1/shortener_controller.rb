# frozen_string_literal: true
require 'clients/bitly_client'

module Api
  module V1
    class ShortenerController < ApplicationController
      def shorten
        response = params[:url].present? ? bitly_client.shorten_url(params[:url]) : missing_url_error
        render_data_json(data: response)
      end

      def lookup
        response = params[:url].present? ? bitly_client.lookup_url(params[:url]) : missing_url_error
        render_data_json(data: response)
      end

      def clicks
      	response = params[:url].present? ? bitly_client.clicks_by_link(params[:url]) : missing_url_error
        render_data_json(data: response)
      end

      private


      def render_data_json(data: {}, code: :ok)
        render json: data, status: code
      end
      
      def missing_url_error
        { error: 'missing url param' }
      end

      def bitly_client
      	@bitly_client || BitlyClient.new
      end
    end
  end
end
