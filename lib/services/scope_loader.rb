class ScopeLoader
  class << self
    def call(data:)
      exchange = ExchangeLoader.call(data: data)
      publisher = PublisherLoader.call(data: data, exchange: exchange)
      app = AppLoader.call(data: data, exchange: exchange, publisher: publisher)
      site = SiteLoader.call(data: data, exchange: exchange, publisher: publisher)
      location = LocationLoader.call(data: data)
      device = DeviceLoader.call(data: data)
      slot = SlotLoader.call(data: data)
      user = UserLoader.call(data: data, exchange: exchange)

      scope = Scope.new(
        exchange: exchange,
        publisher: publisher,
        app: app,
        site: site,
        location: location,
        device: device,
        slot: slot,
        user: user
      )

      return scope
    end
  end
end
