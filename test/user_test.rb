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
      user_status = Slack::User.get
      # assert
      expect(user_status["ok"]).must_equal true
    end
  end

  it ".record_from_hash should return a user from the hash" do
    VCR.use_cassette("user_tests") do
      # act
      user_hash = Slack::User.get
      user = Slack::User.record_from_hash(user_hash["members"][0])
      # assert
      expect(user).must_be_instance_of Slack::User
    end
  end

  it ".get method encounters not authorized error" do
    VCR.use_cassette("user_unauthorized_tests") do
      # act
      # assert
      error = expect { Slack::User.get }.must_raise Slack::SlackError
      expect(error.message).must_equal "not_authed"
    end
  end

  it "gets user base url" do
    VCR.use_cassette("user_tests") do
      expect(Slack::User.get_base_url).must_equal 'https://slack.com/api/users.list?'
    end
  end

  it "gets user details" do
    skip
    VCR.use_cassette("user_tests") do
      expect().must_be_instance_of String
    end
  end
end