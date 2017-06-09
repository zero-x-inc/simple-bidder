class FirehoseSerializer
  class << self
    def call(event:)
      data = {
        'timestamp' => event.timestamp.iso8601,
        'type' => event.type,
        'exchange_id' => event.exchange_id,
        'publisher_id' => event.publisher_id,
        'app_id' => event.app_id,
        'site_id' => event.site_id,
        'country' => event.country,
        'region' => event.region,
        'city' => event.city,
        'js' => event.js,
        'make' => event.make,
        'model' => event.model,
        'os' => event.os,
        'osv' => event.osv,
        'dimension' => event.dimension,
        'device_id' => event.device_id,
        'user_id' => event.user_id,
        'gender' => event.gender,
        'yob' => event.yob
      }

      return data.to_json
    end
  end
end
