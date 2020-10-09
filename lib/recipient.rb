require 'httparty'
require 'prettyprint'
require 'httparty'
require 'dotenv'

module Slack
  class SlackError < StandardError; end

    class Recipient

      attr_reader :slack_id, :name

      def initialize(slack_id, name)
        @slack_id = slack_id
        @name = name
      end

      # returns user/channel data as a hash
      def self.list_all
        response = self.get
        hash_list = response[self.get_result_key]
          hash_list.map do |hash|
            self.record_from_hash(hash)
          end
      end

      # retrieves user/channel data
      def self.get
        response = HTTParty.get(self.get_base_url, query: {
          token: ENV['SLACK_TOKEN'],
        })
        sleep(0.5)
        return response
      end

      def get_details
        @selected.get_details
        #  if @selected is user info
        #  if @selected is channel info Channel.get_details
        # return self.get_details
        #
        # if @selected == user.name || @selected == user.slack_id
        # return User.get_details
        # elsif @selected == channel.name || @selected == channel.slack_id
        # return Channel.get_details
        #
        # if user input ==
        #
      end

      def post_message(message)
        message = HTTParty.post("https://slack.com/api/chat.postMessage", body: {
          token: ENV['SLACK_TOKEN'],
          channel: @slack_id,
          text: message
        })

      end
    end
end