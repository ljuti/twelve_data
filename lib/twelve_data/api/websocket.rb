require "faye/websocket"
require "eventmachine"

module TwelveData
  module Api
    class Websocket
      def initialize(client)
        @_client = client
        @connected = false
      end

      attr_reader :ws

      def start
        Thread.new do
          begin
            EM.run do
              connect
            end
          rescue StandardError => e
            puts "Error in WebSocket connection: #{e.message}"
            retry_connection
          end
        end
      end

      def connect
        @ws = Faye::WebSocket::Client.new(@_client.config.websocket_url)

        ws.on :open do |event|
          puts "WebSocket connection opened to #{@_client.config.websocket_url}"          
          @connected = true
        end

        ws.on :message do |event|
          begin
            data = JSON.parse(event.data)
            handle_message(data)
          rescue JSON::ParserError => e
            puts "Error parsing message: #{e.message}"
          end
        end

        ws.on :error do |event|
          puts "WebSocket error: #{event.message}"
        end

        ws.on :close do |event|
          puts "WebSocket connection closed: #{event.code} - #{event.reason}"
          @connected = false
          @ws = nil
          retry_connection
        end
      end

      def send_message(message)
        if @connected
          ws.send(message.to_json)
        else
          puts "WebSocket is not connected. Cannot send message."
        end
      rescue StandardError => e
        puts "Error sending message: #{e.message}"
      end

      def reset
        send_message({ action: "reset" })
      end

      def subscribe(symbols)
        send_message({ action: "subscribe", params: { symbols: symbols }})
      end

      def unsubscribe(symbols)
        send_message({ action: "unsubscribe", params: { symbols: symbols }})
      end

      def handle_message(data)
        puts "Received message: #{data.inspect}"
        case data["event"]
        when "subscription-status"
          puts "Subscription status: #{data["status"]}"
        when "price"
          puts "Price update: #{data["data"]}"
        end
      end

      def retry_connection
        puts "Retrying WebSocket connection..."
        sleep 5
        connect
      end
    end
  end
end