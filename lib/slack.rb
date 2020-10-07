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
    puts '1.List Users'
    puts '2.List Channels'
    puts '3.Quit'
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

