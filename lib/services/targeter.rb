class Targeter
  class << self
    def call(bid_request:)
      advertisements = Advertisement.all
      return advertisements.last
    end
  end
end
