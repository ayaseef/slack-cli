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
    end

    def find_user(selected_user)
      @selected = @users.find { |user| user.name == selected_user || user.slack_id == selected_user }
    end

    def get_details
      if @selected != nil
        return @selected.get_details
      else
        raise SlackError, "Must select user or channel!"
      end
    end

    def send_message
      if @selected != nil
        return @selected.send_message
      else
        raise SlackError, "Must select user or channel!"
      end
    end
  end
end
