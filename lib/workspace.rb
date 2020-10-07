require 'httparty'
require 'prettyprint'
require 'dotenv'
Dotenv.load

module Slack

BASE_CHANNEL_URL = 'https://slack.com/api/conversations.list'
BASE_USER_URL = 'https://slack.com/api/users.list?'
KEY = ENV['SLACK_TOKEN']

class Workspace

  attr_reader :users, :channels, :selected

  def initialize
    @users = User.list_all
    @channels = Channel.list_all
  end

  def list_users
    puts "Users List:"
    @users.each do |user|
      puts "Username: #{user.name}, Name: #{user.real_name}, SlackID: #{user.slack_id}"
    end
  end

  def list_channels
    puts "Channels List:"
    @channels.each do |channel|
      puts "Name: #{channel.name}, Topic: #{channel["topic"]["value"].capitalize}, Members: #{user_hash["num_members"]}, SlackID: #{user_hash["id"]}"
    end
  end
  def select_channel

  end
  def select_user

  end
  def details

  end
  def send_message

  end
end

end
