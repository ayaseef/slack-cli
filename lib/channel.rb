require 'httparty'
require 'prettyprint'
require 'dotenv'
Dotenv.load
require_relative 'workspace'

class Channel < Recipient

  attr_reader :topic, :member_count

  def initialize(topic, member_count)
    workspace = Workspace.new
    @topic = topic
    @member_count = member_count
  end

  p member_count
  def details

  end

  def self.list_all
    channel_hash_list = HTTParty.get(BASE_CHANNEL_URL, query: {
      token: KEY,
    })['channels']
    channel_hash_list.map do |channel_hash|
    Channel.new(user_hash["name"], user_hash["topic"]["value"], user_hash["num_members"], user_hash["id"])
    end)
  end

end