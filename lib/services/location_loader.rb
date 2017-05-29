class LocationLoader
  class << self
    def call(data:)
      location_data = data['device']['geo']

      location = Location.new(
        country: location_data['country'],
        region: location_data['region'],
        city: location_data['city']
      )

      return location
    end
  end
end
