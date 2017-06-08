class BidLoader
  class << self
    def call(data:)
      bid = Bid.find(data['bid_id'])
      return bid
    end
  end
end
