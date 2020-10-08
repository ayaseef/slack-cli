require_relative 'channel'
require_relative 'user'
require 'prettyprint'

module Slack

  class Workspace

    attr_reader :users, :channels, :selected

    def initialize
      @users = User.list_all
      @channels = Channel.list_all
      # @selected = XXXXX
    end

    def selected

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

    # def select_channel
    #
    # end
    # def select_user
    #
    # end
    # def details
    #
    # end
    # def send_message
    #
    # end
  end

end
