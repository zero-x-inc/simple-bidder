class BidRequestCreator
  class << self
    def call(data:, scope:)
      bid_request = BidRequest.new(
        id: SecureRandom.hex,
        external_id: data['id'],
        timestamp: DateTime.now.utc
      )

      return bid_request
    end
  end
end
