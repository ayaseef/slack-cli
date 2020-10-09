require_relative './test_helper'
require_relative '../lib/slack.rb'

xdescribe "Slack" do
  it " " do
    skip
    VCR.use_cassette("slack_tests") do
      # act
     Slack::Slack
      # assert
      expect( ).must_equal
    end
  end
end