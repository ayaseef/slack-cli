#!/usr/bin/env ruby

require_relative 'workspace.rb'


def main

  # TODO project

  workspace = Workspace.new
  puts 'Welcome to the Ada Slack CLI!'
  puts "We have #{workspace.users.length} members and #{workspace.channels.length} channels."

  loop = true

  while loop
    puts 'Please select from the following:'
    puts 'List Users'
    puts 'Select Users' # => if the user initially chooses to list users --1. List users, 2. Select user
    puts 'List Channels' # => if the user initially chooses to list channels --1. List channel, 2. Select channel
    puts 'Select Channels'
    puts 'Details' # => Show details of the "SELECTED USER or CHANNEL by the user."
    puts 'Quit'
    print 'Enter your selection here: >'

    user_input = gets.chomp.to_s.upcase

    case user_input
    when 'LIST USERS'
      workspace.list_users
      loop = false
    when 'LIST CHANNELS'
      workspace.list_channels
      loop = false
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

