# frozen_string_literal: true
require 'clients/bitly_client'

module Api
  module V1
    class LinksController < ApplicationController
      def index
        @links = Link.all.limit(100)
        render_data_json(data: @links)
      end
      
      def shorten
        response = params[:url].present? ? bitly_client.shorten_url(params[:url]) : missing_url_error
        if response.success?
          LinkJob.perform_later(response.body)
        end
        render_data_json(data: response.body)
      end

      def lookup
        response = params[:url].present? ? bitly_client.lookup_url(params[:url]) : missing_url_error
        render_data_json(data: response.body)
      end

      def clicks
      	response = params[:url].present? ? bitly_client.clicks_by_link(params[:url]) : missing_url_error
        render_data_json(data: response.body)
      end

      private


      def render_data_json(data: {}, code: :ok)
        render json: data, status: code
      end
      
      def missing_url_error
        { error: 'missing url param', code: :unprocessable_entity }
      end

      def bitly_client
      	@bitly_client || BitlyClient.new
      end
    end
  end
end
