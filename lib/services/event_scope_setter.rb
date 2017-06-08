class EventScopeSetter
  class << self
    def call(event:, scope:)
      event.seat_id = scope.seat.present? ? scope.seat.id : nil
      event.campaign_id = scope.campaign.present? ? scope.campaign.id : nil
      event.advertisement_id = scope.advertisement.present? ? scope.advertisement.id : nil
      event.bid_request_id = scope.bid_request.present? && event.bid_request_id.blank? ? scope.bid_request.id : event.bid_request_id 
      event.bid_request_id = scope.bid.present? && event.bid_request_id.blank? ? scope.bid.bid_request_id : event.bid_request_id 
      event.exchange_id = scope.exchange.id
      event.publisher_id = scope.publisher.id
      event.app_id = scope.app.present? ? scope.app.id : nil
      event.site_id = scope.site.present? ? scope.site.id : nil
      event.country = scope.location.present? ? scope.location.country : nil
      event.region = scope.location.present? ? scope.location.region : nil
      event.city = scope.location.present? ? scope.location.city : nil
      event.js = scope.device.present? ? scope.device.js : nil
      event.make = scope.device.present? ? scope.device.make : nil
      event.model = scope.device.present? ? scope.device.make : nil
      event.os = scope.device.present? ? scope.device.os : nil
      event.osv = scope.device.present? ? scope.device.osv : nil
      event.dimension = scope.slot.present? ? scope.slot.dimension : nil
      event.device_id = scope.device.present? ? scope.device.id : nil
      event.user_id = scope.user.present? ? scope.user.id : nil
      event.gender = scope.user.present? ? scope.user.gender : nil
      event.yob = scope.user.present? ? scope.user.yob : nil
      return event
    end
  end
end
