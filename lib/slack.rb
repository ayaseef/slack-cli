#!/usr/bin/env ruby
require_relative 'workspace'
require 'table_print'

  def main

    Dotenv.load

    workspace = Slack::Workspace.new

    puts 'Welcome to the Ada Slack CLI!'
    # puts "We have #{workspace.users.length} members and #{workspace.channels.length} channels."

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
        pp workspace.find_user
      when 'SELECT CHANNEL'

      when "DETAILS"
        begin
          puts workspace.get_details
        rescue SlackError => error
          puts error.message
        end
      when 'SEND MESSAGE'
        workspace.send_test_message
        return
      when 'QUIT'
        exit
      else
        puts "You can do better. Try again. Stick with the prompt options."
        loop = true
      end
    end
    puts 'Thank you for using the Ada Slack CLI'
  end

main if __FILE__ == $PROGRAM_NAME