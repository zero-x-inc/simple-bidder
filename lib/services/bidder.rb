class Bidder
  class << self
    def call(advertisement:, bid_request:)
      bid_price = 1.50

      bid = Bid.new(
        type: 'bid',
        bid_request_id: bid_request.id,
        exchange_id: bid_request.exchange.id,
        publisher_id: bid_request.publisher.id,
        app_id: bid_request.app.present? ? bid_request.app.id : nil,
        site_id: bid_request.site.present? ? bid_request.site.id : nil,
        device_id: bid_request.device.present? ? bid_request.device.id : nil,
        user_id:  bid_request.user.present? ? bid_request.user.id : nil,
        country: bid_request.location.present? ? bid_request.location.country : nil,
        region: bid_request.location.present? ? bid_request.location.region : nil,
        city: bid_request.location.present? ? bid_request.location.city : nil,
        timestamp: DateTime.now.utc,
        cost: (bid_price * 1_000_000).to_i
      )

      bid.save!
      return bid
    end
  end
end
