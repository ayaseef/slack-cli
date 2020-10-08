require_relative 'recipient'
require 'prettyprint'


module Slack

  class Channel < Recipient

    BASE_CHANNEL_URL = 'https://slack.com/api/conversations.list'

    attr_reader :id, :name, :topic, :num_members

    def initialize(id, name, topic, num_members)
      # workspace = Workspace.new
      @slack_id = id
      @name = name
      @topic = topic
      @num_members = num_members
    end

    # def details
    #
    # end

    def self.get_base_url
      BASE_CHANNEL_URL
    end

    def self.get_result_key
      "channels"
    end

    def self.record_from_hash(hash)
      Channel.new(hash["id"], hash["name"], hash["topic"]["value"], hash["num_members"])
    end

  end
end

# def self.list_all
#   channel_hash_list = HTTParty.get(BASE_CHANNEL_URL, query: {
#     token: KEY,
#   })['channels']
#   channel_hash_list.map do |hash|
#
#   end)
# end