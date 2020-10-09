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
      puts 'Send Message'
      puts 'Quit'
      print 'Enter your selection here: >'
    end

    def list_users
      return @users
    end

    def list_channels
      return @channels
    end

    # Finds and stores selected channel in channel instance variable
    # returns nil if incorrect user_selection
    def find_channel
      puts "Please provide a Channel Name or Slack ID: "
      print ">"
      selected_channel = gets.chomp
      # Returns as @selected instance variable
      @selected = @channels.find { |channel| channel.name == selected_channel || channel.slack_id == selected_channel }
      if selected_channel != nil
        puts "We found your user!"
      else
        puts "Oops, #{selected_channel}, does not exist as a user.  Try again!"
      end
      @selected
    end

    # Finds and stores selected channel in user instance variable
    # returns nil if incorrect user_selection
    def find_user
      puts "Please provide a Name or Slack ID: "
      print ">"
      selected_user = gets.chomp
      # Returns as @selected instance variable
      @selected = @users.find { |user| user.name == selected_user || user.slack_id == selected_user }
        if selected_user != nil
          puts "We found your user!"
        else
          puts "Oops, #{selected_user}, does not exist as a user.  Try again!"
        end
      @selected
    end

    # def helper_find
    #   if selected != nil || selected != nil
    #     puts "We found it!"
    #   else
    #     puts "Oops, #{@selected}, does not exist as a user.  Try again!"
    #   end
    # end

    def send_test_message
      print "Enter the message you would like to send to #{@selected.name}:>"
      end_user_message = gets.chomp
      @selected.post_message(end_user_message)
      puts "Your message has been sent!"
      puts 'Thank you for using the Ada Slack CLI'
    end

    def get_details
      if @selected != nil
        return @selected.get_details
      else
        puts "You need to select a User or Channel."
        puts "Start again."
        # raise SlackError, "Must select user or channel!"
      end
    end
  end
end
