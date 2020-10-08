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
      response = self.get
      hash_list = response[self.get_result_key]

        hash_list.map do |hash|
          self.record_from_hash(hash)

        end
    end

    def self.get
      response = HTTParty.get(self.get_base_url, query: {
        token: ENV['SLACK_TOKEN'],
      })
      return response
    end
    # def self.validate_user_id(id)
    #   if id.nil? || id <= 0
    #     raise ArgumentError, 'ID cannot be blank or less than one.'
    #   end
    # end
    #
    # def self.validate_user_name(id)
    #   if id.nil? || id <= 0
    #     raise ArgumentError, 'ID cannot be blank or less than one.'
    #   end
    # end
    #
    # def self.validate_channel_id(id)
    #   if id.nil? || id <= 0
    #     raise ArgumentError, 'ID cannot be blank or less than one.'
    #   end
    # end

  end
end