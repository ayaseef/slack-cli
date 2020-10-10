#!/usr/bin/env ruby
require_relative 'workspace'
require 'table_print'
require 'awesome_print'


def main
  Dotenv.load

  workspace = Slack::Workspace.new

  puts 'Welcome to the Ada Slack CLI!'
  puts "We have #{workspace.users.length} members and #{workspace.channels.length} channels."

  loop = true
  while loop
    command
    user_input = gets.chomp.to_s.upcase
    case user_input
    when 'LIST USERS'
      tp workspace.list_users, "slack_id", "name", "real_name"
    when 'LIST CHANNELS'
      tp workspace.list_channels,"slack_id", "name", "topic", "num_members"
    when 'SELECT USER'
      handle_select_user(workspace)
    when 'SELECT CHANNEL'
      handle_select_channel(workspace)
    when "DETAILS"
      handle_get_details(workspace)
    when 'SEND MESSAGE'
      handle_send_message(workspace)
    when 'QUIT'
      loop = false
    else
       puts "You can do better. Try again. You need to select a User or Channel."
       loop = true
    end
  end
  puts 'Thank you for using the Ada Slack CLI'
end

def command
  puts 'Please select from the following:'
  puts 'List Users'
  puts 'Select User'
  puts 'List Channels'
  puts 'Select Channel'
  puts 'Details'
  puts 'Send Message'
  puts 'Quit'
  print 'Enter your selection here: >'
end

def handle_select_user(workspace)
  puts "Please provide a Name or Slack ID: "
  print ">"
  selected_user = gets.chomp
  selected = workspace.find_user(selected_user)
  if selected != nil
    puts "We found #{selected.name}!"
  else
    puts "Oops, #{selected_user}, does not exist as a user. Try again!"
  end
end

def handle_select_channel(workspace)
  puts "Please provide a Name or Slack ID: "
  print ">"
  selected_channel = gets.chomp
  selected = workspace.find_channel(selected_channel)
  if selected != nil
    puts "We found #{selected.name}!"
  else
    puts "Oops, #{selected_channel}, does not exist as a user. Try again!"
  end
end

def handle_get_details(workspace)
  pp workspace.get_details
rescue Slack::SlackError
  puts "You need to select a User or Channel."
  puts "Start again."
end

def handle_send_message(workspace)
  begin
  print "Enter the message you would like to send to #{workspace.selected.name}:>"
  end_user_message = gets.chomp
  selected.post_message(end_user_message)
  puts "Your message has been sent!"
  rescue
  puts "You need to select a User or Channel."
  puts "Start again."
  end
end

main if __FILE__ == $PROGRAM_NAME