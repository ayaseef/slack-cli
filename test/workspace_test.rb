require_relative './test_helper'
require_relative '../lib/workspace.rb'

xdescribe "workspace" do
  it "has this many workspace" do
    VCR.use_cassette("workspace_tests") do
      # act
      Slack::Workspace
      # assert
      expect().must_equal
    end
  end

end