

class Recipient # < (Channel,???? User)

  attr_readers :slack_id, :name

  def initialize
    @slack_id =
    @name =
  end

  def self.list_all
    hash_list = HTTParty.get(self.get_base_url, query: {
      token: KEY,
    })[self.get_result_key]
    hash_list.map do |hash|
      self.record_from_hash(hash)
    end
  end
end