class ExchangeLoader
  class << self
    def call(data:)
      exchange = Exchange.find_by(canonical_id: data['exchange_id'])
      return exchange
    end
  end
end
