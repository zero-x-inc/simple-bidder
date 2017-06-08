class Bidder
  class << self
    def call(scope:, advertisement:, bid_request:)
      bid_price = 1.50

      bid = Bid.new(
        type: 'bid',
        timestamp: DateTime.now.utc,
        cost: (bid_price * 1_000_000).to_i,
        bid_request_id: bid_request.id
      )

      bid = EventScopeSetter.call(
        event: bid,
        scope: scope
      )

      bid.save!
      return bid
    end
  end
end
