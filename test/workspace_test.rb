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
    expect(result).must_be_instance_of Array
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

  it "unable to find user " do
    skip
  end

  it "finds channel successfully" do
    channel_name = "getting-help"

    result = @workspace.find_channel(channel_name)

    expect(result).must_be_instance_of Slack::Channel
    expect(result.name).must_equal channel_name
  end

  it "get details when selected is nil" do
    skip

    # arrange
    # act
    # assert
  end

  it "get details when selected returns details" do
    skip
  end

end
