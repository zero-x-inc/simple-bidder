module V1
  class EventsController < SimpleBidderApp
    get '/' do
      scope = EventScopeLoader.call(data: params)

      event = Event.new(
        type: params['type'],
        timestamp: DateTime.now.utc,
        bid_request_id: scope.bid.present? ? scope.bid.bid_request_id : nil
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
