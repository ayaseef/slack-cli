require_relative './test_helper'
require_relative '../lib/channel.rb'

describe "Channel" do
  it "has this many channels" do
    VCR.use_cassette("channel_tests") do
      # act
      channel_count = Slack::Channel.list_all.length
      # assert
      expect(channel_count).must_equal 47
    end
  end

  it ".get method message is true" do
    VCR.use_cassette("channel_tests") do
      # act
      channel_status = Slack::Channel.get
      # assert
      expect(channel_status["ok"]).must_equal true
      expect(channel_status).must_be_instance_of HTTParty::Response
    end
  end

  it ".get method encounters HTTP error" do
    VCR.use_cassette("channel_error_tests") do
      # act
      # assert
      error = expect { Slack::Channel.get }.must_raise Slack::SlackError
      expect(error.message).must_equal "Something went wrong: 500"

    end
  end

  it ".get method encounters not authorized error" do
    VCR.use_cassette("channel_unauthorized_tests") do
      # act
      # assert
      error = expect { Slack::Channel.get }.must_raise Slack::SlackError
      expect(error.message).must_equal "not_authed"
    end
  end

  it "gets channel base url" do
    VCR.use_cassette("channel_tests") do
      expect(Slack::Channel.get_base_url).must_equal 'https://slack.com/api/conversations.list'
    end
  end

  it "gets details for channel" do
    skip
    VCR.use_cassette("channel_tests") do

    end
  end

  it "record from hash returns an instance of channel " do
    skip
    VCR.use_cassette("channel_tests") do

    end
  end


end

