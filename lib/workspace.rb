require 'httparty'
require 'prettyprint'
require 'dotenv'
Dotenv.load

BASE_CHANNEL_URL = 'https://slack.com/api/conversations.list'
BASE_USER_URL = 'https://slack.com/api/users.list?'
KEY = ENV['SLACK_TOKEN']

class Workspace

  attr_reader :users, :channels

  def initialize
    @users = HTTParty.get(BASE_USER_URL, query: {
        token: KEY,
    })['members']
    @channels = HTTParty.get(BASE_CHANNEL_URL, query: {
        token: KEY,
    })['channels']
  end

  def list_users
    puts "Users List:"
    @users.each do |user_hash|
      puts "Username: #{user_hash["name"]}, Name: #{user_hash["real_name"]}, SlackID: #{user_hash["id"]}"
    end
  end

  def list_channels
    puts "Channels List:"
    @channels.each do |user_hash|
      puts "Name: #{user_hash["name"].capitalize}, Topic: #{user_hash["topic"]["value"].capitalize}, Members: #{user_hash["num_members"]}, SlackID: #{user_hash["id"]}"
      end
    end
  end

  def user_count
    @users.length
  end

  def channel_count
    @channels.length
  end


