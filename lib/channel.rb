require_relative 'recipient'
require 'prettyprint'


module Slack

  class Channel < Recipient

    BASE_CHANNEL_URL = 'https://slack.com/api/conversations.list'

    attr_reader :topic, :num_members

    def initialize(slack_id, name, topic, num_members)
      # workspace = Workspace.new
      super(slack_id, name)
      @topic = topic
      @num_members = num_members
    end

    def get_details
      return "Channel Name:#{@name}...."

    end

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



# Below method was re-factored and placed in recipient to grab info from user and channel classes
# def self.list_all
#   channel_hash_list = HTTParty.get(BASE_CHANNEL_URL, query: {
#     token: KEY,
#   })['channels']
#   channel_hash_list.map do |hash|
#
#   end)
# end