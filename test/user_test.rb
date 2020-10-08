require_relative './test_helper'
require_relative '../lib/user.rb'

describe "User" do
  it "has this many users" do
    VCR.use_cassette("user_tests") do
      # act
      user_count = Slack::User.list_all.length
      # assert
      expect(user_count).must_equal 162
    end
  end

  it ".get method message is true" do
    VCR.use_cassette("user_tests") do
      # act
      user_status = Slack::Channel.get
      # assert
      expect(user_status["ok"]).must_equal true
    end
  end

  it ".get method unauthorized" do
    VCR.use_cassette("user_error_tests") do
      # act
      user_status = Slack::Channel.get
      # assert
      expect(user_status["ok"]).must_equal false
    end
  end

end