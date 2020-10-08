require_relative 'channel'
require_relative 'user'
require 'prettyprint'

module Slack

  class Workspace

    attr_reader :users, :channels, :selected

    def initialize
      @users = User.list_all
      @channels = Channel.list_all
      @selected = nil
    end

    def list_users
      return @users
      # puts "Users List:"
      # @users.each do |user|
      #   puts "Username: #{user.name}, Name: #{user.real_name}, SlackID: #{user.slack_id}"
      # end
    end

    def list_channels
      return @channels
      # puts "Channels List:"
      # @channels.each do |channel|
        # puts "Name: #{channel.name}, Topic: #{channel.topic}, Members: #{channel.num_members}, SlackID: #{channel.id}"
      # end
    end

    def find_channel(channel_selection)
      @selected = @channels.find { |channel| channel.name == channel_selection || channel.id == channel_selection }
      @selected
    end

    def find_user(user_selection)
      @selected = @users.find { |user| user.name == user_selection || user.slack_id == user_selection }
      @selected
    end

    # def details
    #
    # end
    # def send_message
    #
    # end
  end
end
