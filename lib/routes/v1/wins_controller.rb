module V1
  class WinsController < SimpleBidderApp
    get '/' do
      scope = EventScopeLoader.call(data: params)

      win = Win.new(
        type: 'win',
        timestamp: DateTime.now.utc,
        bid_request_id: scope.bid.present? ? scope.bid.bid_request_id : nil,
        price: params['price']
      )

      win = EventScopeSetter.call(
        event: win,
        scope: scope
      )

      win.save!

      RealtimeSender.call(
         data: FirehoseSerializer.call(
           event: win
         )
       )

      status 201
    end
  end
end
