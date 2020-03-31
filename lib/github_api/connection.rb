# frozen_string_literal: true
require 'net/http'

class Connection
  BASE_API_URL = 'https://api.github.com'

  class << self
    def rest_api
      Faraday.new(url: BASE_API_URL) do |conn|
        conn.response :logger

        github_token = Rails.application.credentials.dig(:github, :access_token)
        conn.authorization 'token', github_token
        conn.adapter Faraday.default_adapter
        # conn.response :json
      end
    end
  end
end