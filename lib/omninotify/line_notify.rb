require "omninotify/line_notify/version"
require 'faraday'

module Omninotify
  module LineNotify
    class Client  < Base
      def initialize(token)
        @token = token
      end

      def notify(message, options = {})
        # retrieve token
        token = @token

  			# create http post
        url = 'https://notify-api.line.me/api/notify'
        conn = ::Faraday.new(url: url)
        conn.authorization :Bearer, 'Bearer ' + token
        response = conn.post do |req|
          req.body = {message: message}
        end
      end

      def key
        :line_notify
      end
    end
  end
end
