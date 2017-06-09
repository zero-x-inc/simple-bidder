class BidSerializer
  class << self
    def call(bid:)
      seatbid = {
        bid: [
          {
            id: bid.id,
            impid: bid.id,
            price: bid.cost,
            adid: bid.advertisement.id,
            nurl: "http://localhost:9292/v1/wins?bid_id=#{bid.id}",
            adm: bid.advertisement.content,
            adomain: ['zero-x.co'],
            iurl: 'http://via.placeholder.com/320x480',
            w: bid.advertisement.dimension.split('x').first,
            h: bid.advertisement.dimension.split('x').last
          }
        ],
        seat: bid.seat_id
      }

      data = {
        id: bid.bid_request_id,
        seatbid: [seatbid],
        bidid: bid.id
      }

      return data.to_json
    end
  end
end
