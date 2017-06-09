class EventScopeLoader
  class << self
    def call(data:)
      scope = Scope.new

      bid = BidLoader.call(data: data)

      if bid.present?
        scope.bid = bid
        scope.seat = Seat.find(bid.seat_id)
        scope.campaign = Campaign.find(bid.campaign_id)
        scope.advertisement = Advertisement.find(bid.advertisement_id)
        scope.exchange = Exchange.find(bid.exchange_id)
        scope.publisher = Publisher.find(bid.publisher_id)
        scope.app = bid.app_id.present? ? App.find(bid.app_id) : nil
        scope.site = bid.site_id.present? ? Site.find(bid.site_id) : nil
        scope.device = bid.device_id.present? ? Device.find(bid.device_id) : nil
        scope.user = bid.user_id.present? ? User.find(bid.user_id) : nil

        scope.slot = Slot.new(
          width: bid.dimension.split('x').first,
          height: bid.dimension.split('x').last
        )

        scope.location = Location.new(
          country: bid.country,
          region: bid.region,
          city: bid.city
        )
      end

      return scope
    end
  end
end
