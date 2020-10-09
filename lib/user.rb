require_relative 'recipient'
require 'prettyprint'



module Slack

  class User < Recipient

    BASE_USER_URL = 'https://slack.com/api/users.list?'

    attr_reader :real_name

    def initialize(slack_id, name, real_name)
      super(slack_id, name)
      @real_name = real_name
    end

    def get_details
      return "User Name:#{@name}, ..."
    end

    def self.get_base_url
      BASE_USER_URL
    end

    def self.get_result_key
      "members"
    end

    def self.record_from_hash(hash)
      User.new(hash["id"], hash["name"], hash["real_name"])
    end


  end
end


# def self.list_all
#   user_hash_list = HTTParty.get(BASE_USER_URL, query: {
#     token: KEY,
#   })['members']
#   user_hash_list.map do |user_hash|
#     User.new(user_hash["id"], user_hash["name"], user_hash["real_name"])
#   end
# end