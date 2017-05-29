class DeviceLoader
  class << self
    def call(data:)
      device_data = data['device']
      external_id = device_data['ifa'] || device_data['didsha1'] || device_data['dpidsha1']
      return nil unless external_id.present?

      device = Device.find_or_create_by(
        external_id: external_id
      )

      device.make = device_data['make']
      device.model = device_data['model']
      device.os = device_data['os']
      device.osv = device_data['osv']
      device.js = device_data['js']
      device.save! if device.changed?
      return device
    end
  end
end
