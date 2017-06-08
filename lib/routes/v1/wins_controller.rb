module V1
  class WinsController < SimpleBidderApp
    get '/' do
      scope = EventScopeLoader.call(data: params)

      event = Win.new(
        type: 'win',
        timestamp: DateTime.now.utc,
        bid_request_id: scope.bid.present? ? scope.bid.bid_request_id : nil,
        price: params['price']
      )

      event = EventScopeSetter.call(
        event: event,
        scope: scope
      )

      event.save!
      status 201
    end
  end
end
