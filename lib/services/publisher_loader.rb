class PublisherLoader
  class << self
    def call(data:, exchange:)
      publisher_data = data['app']['publisher']

      publisher = Publisher.find_or_create_by(
        exchange_id: exchange.id,
        external_id: publisher_data['id']
      )

      if publisher.name != publisher_data['name']
        publisher.name = publisher_data['name']
      end

      publisher.save! if publisher.changed?
      return publisher
    end
  end
end
