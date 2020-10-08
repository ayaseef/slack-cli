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
      puts 'Please select from the following:'
      puts 'List Users'
      puts 'Find user by name or ID' # => if the user initially chooses to list users --1. List users, 2. Select user
      puts 'List Channels' # => if the user initially chooses to list channels --1. List channel, 2. Select channel
      puts 'find channel by name or id'
      puts 'Details' # => Show details of the "SELECTED USER or CHANNEL by the user."
      puts 'Quit'
      print 'Enter your selection here: >'

      user_input = gets.chomp.to_s.upcase

      case user_input
      when 'LIST USERS'
        tp workspace.list_users, "slack_id", "name", "real_name"
        loop = false
      when 'LIST CHANNELS'
        tp workspace.list_channels,"slack_id", "name", "topic", "num_members"
        loop = false
      when 'SELECT USER'
        puts "Please provide a Name or Slack ID: "
        print ">"
        selected_user = gets.chomp

      when 'SELECT CHANNEL'

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