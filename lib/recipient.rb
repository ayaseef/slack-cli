require 'httparty'
require 'prettyprint'
require 'httparty'
require 'dotenv'



module Slack

  class Recipient

    attr_reader :slack_id, :name

    def initialize(slack_id, name)
      @slack_id = slack_id
      @name = name
    end

    def self.list_all
      response = HTTParty.get(self.get_base_url, query: {
        token: ENV['SLACK_TOKEN'],
      })
      hash_list = response[self.get_result_key]

        hash_list.map do |hash|
          self.record_from_hash(hash)

        end
    end

  end
end