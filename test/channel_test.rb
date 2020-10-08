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
    end
  end

  it ".get method unauthorized" do
    VCR.use_cassette("channel_error_tests") do
      # act
      channel_status = Slack::Channel.get
      # assert
      expect(channel_status["ok"]).must_equal false
    end
  end
end