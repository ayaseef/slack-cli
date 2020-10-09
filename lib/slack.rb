#!/usr/bin/env ruby
require_relative 'workspace'
require 'table_print'

  def main
    Dotenv.load
    workspace = Slack::Workspace.new

    puts 'Welcome to the Ada Slack CLI!'
    puts "We have #{workspace.users.length} members and #{workspace.channels.length} channels."

    loop = true
      while loop
        workspace.command
        user_input = gets.chomp.to_s.upcase
        case user_input
          when 'LIST USERS'
            tp workspace.list_users, "slack_id", "name", "real_name"
          when 'LIST CHANNELS'
            tp workspace.list_channels,"slack_id", "name", "topic", "num_members"
          when 'SELECT USER'
            workspace.find_user
          when 'SELECT CHANNEL'
            workspace.find_channel
          when "DETAILS"
            puts workspace.get_details
          when 'SEND MESSAGE'
            workspace.send_test_message
            return
          when 'QUIT'
            loop = false
          else
             puts "You can do better. Try again. You need to select a User or Channel."
             loop = true
          end
      end
    end
    puts 'Thank you for using the Ada Slack CLI'


main if __FILE__ == $PROGRAM_NAME