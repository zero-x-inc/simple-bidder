class BidRequestLoader
  class << self
    ## create a bid request object that contains all found or created resources
    def call(data:)
      exchange = ExchangeLoader.call(data: data)
      publisher = PublisherLoader.call(data: data, exchange: exchange)
      app = AppLoader.call(data: data, exchange: exchange, publisher: publisher)
      site = SiteLoader.call(data: data, exchange: exchange, publisher: publisher)
      location = LocationLoader.call(data: data)
      device = DeviceLoader.call(data: data)
      slot = SlotLoader.call(data: data)
      user = UserLoader.call(data: data, exchange: exchange)

      bid_request = BidRequest.new(
        id: SecureRandom.hex,
        timestamp: DateTime.now,
        external_id: data['id'],
        exchange: exchange,
        publisher: publisher,
        app: app,
        site: site,
        location: location,
        device: device,
        slot: slot,
        user: user
      )

      return bid_request
    end
  end
end
