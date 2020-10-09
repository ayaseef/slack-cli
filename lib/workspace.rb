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

    def command
      puts 'Please select from the following:'
      puts 'List Users'
      puts 'Select User' # => if the user initially chooses to list users --1. List users, 2. Select user
      puts 'List Channels' # => if the user initially chooses to list channels --1. List channel, 2. Select channel
      puts 'Select Channel'
      puts 'Details'
      puts 'Snd Message'
      puts 'Quit'
      print 'Enter your selection here: >'
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
    # Finds and stores selected channel in channel instance variable
    # returns nil if incorrect user_selection
    def find_channel(channel_selection)
      @selected = @channels.find { |channel| channel.name == channel_selection || channel.id == channel_selection }
      @selected
    end
    # Finds and stores selected channel in user instance variable
    # returns nil if incorrect user_selection
    def find_user(user_selection)
      @selected = @users.find { |user| user.name == user_selection || user.slack_id == user_selection }
      @selected
    end

    def send_test_message
      @selected.post_message("Hello from Blaine and Ayesha")
    end

    def get_details
      if @selected != nil
        return @selected.get_details
      else
        raise SlackError, "Must select user or channel!"
      end
    end


  end
end
