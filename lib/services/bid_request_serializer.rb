class BidRequestSerializer
  class << self
    def call(bid_request:)
      data = {
        'timestamp' => bid_request.timestamp.iso8601,
        'type' => 'bid_request',
        'bid_requests' => 1,
        'exchange_id' => bid_request.exchange.id,
        'publisher_id' => bid_request.publisher.id,
        'app_id' => bid_request.app.present? ? bid_request.app.id : nil,
        'site_id' => bid_request.site.present? ? bid_request.site.id : nil,
        'country' => bid_request.location.country,
        'region' => bid_request.location.region,
        'city' => bid_request.location.city,
        'js' => bid_request.device.js,
        'make' => bid_request.device.make,
        'model' => bid_request.device.model,
        'os' => bid_request.device.os,
        'osv' => bid_request.device.osv,
        'dimension' => bid_request.slot.dimension,
        'blocked_attributes' => bid_request.slot.blocked_attributes,
        'device_id' => bid_request.device.id,
        'user_id' => bid_request.user.id,
        'gender' => bid_request.user.gender,
        'yob' => bid_request.user.yob
      }

      return data.to_json
    end
  end
end
