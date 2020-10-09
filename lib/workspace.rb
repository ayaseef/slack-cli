require_relative 'channel'
require_relative 'user'
require 'pp'

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
    end

    def list_channels
      return @channels
    end

    def find_channel(selected_channel)
      @selected = @channels.find { |channel| channel.name == selected_channel || channel.slack_id == selected_channel }
      return @selected
    end

    def find_user(selected_user)
      @selected = @users.find { |user| user.name == selected_user || user.slack_id == selected_user }
      return @selected
    end

    def get_details
      if @selected != nil
        return @selected.get_details
      else
        raise SlackError, "Must select user or channel!"
      end
    end

    def send_message
      print "Enter the message you would like to send to #{@selected.name}:>"
      end_user_message = gets.chomp
      selected.post_message(end_user_message)
      puts "Your message has been sent!"
    end
  end
end
