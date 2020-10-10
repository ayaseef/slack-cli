require_relative './test_helper'
require_relative '../lib/workspace.rb'

describe "Workspace" do
  before do
    VCR.use_cassette("workspace_test") do
      @workspace = Slack::Workspace.new
    end
  end

  it "creates a new workspace" do
    expect(@workspace).must_be_instance_of Slack::Workspace
  end

  it "lists users" do
    result = @workspace.list_users
    first_user = result[0]
    expect(result).must_be_instance_of Array
    expect(first_user).must_be_instance_of Slack::User
    expect(first_user.name).must_equal "slackbot"
  end

  it "lists channels" do
    result = @workspace.list_channels
    expect(result).must_be_instance_of Array
  end

  it "finds user successfully" do
    #arrange
    #specifing the argument
    user_name = "b.atsbeha"

    #act
    #calling the method & set to variable
    result = @workspace.find_user(user_name)

    #assert
    #asserting what we expect to happen
    expect(result).must_be_instance_of Slack::User
    expect(result.name).must_equal user_name
  end

  it "finds channel successfully" do
    channel_name = "getting-help"

    result = @workspace.find_channel(channel_name)

    expect(result).must_be_instance_of Slack::Channel
    expect(result.name).must_equal channel_name
  end

  it "get details throws error when selected is nil" do
    expect { @workspace.get_details }.must_raise Slack::SlackError
  end

  it "get details when selected returns details" do
    # arrange
    users = @workspace.users
    selected_user = users[0] #slackbot
    @workspace.find_user(selected_user.name)

    # act
    details = @workspace.get_details

    # assert
    expect(details).must_be_kind_of String
    expect(details).must_include "slackbot"
  end
end
