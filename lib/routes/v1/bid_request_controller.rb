module V1
  class BidRequestController < SimpleBidderApp
    post '/:exchange_id' do
      data = JSON.parse(request.env['rack.input'].read).merge(
        {
          'exchange_id' => params['exchange_id']
        }
      )

      scope = ScopeLoader.call(data: data)

      bid_request = BidRequestCreator.call(
        scope: scope,
        data: data
      )

      scope.bid_request = bid_request

      if bid_request.present?
        bid_request = EventScopeSetter.call(
          event: bid_request,
          scope: scope
        )

        RealtimeSender.call(
          data: FirehoseSerializer.call(
            event: bid_request
          )
        )

        advertisement = Targeter.call(
          bid_request: bid_request
        )

        if advertisement.present?
          scope.seat = advertisement.campaign.seat
          scope.campaign = advertisement.campaign
          scope.advertisement = advertisement

          bid = Bidder.call(
            scope: scope,
            advertisement: advertisement,
            bid_request: bid_request
          )

          if bid.present? && bid.persisted?
            RealtimeSender.call(
              data: FirehoseSerializer.call(
                event: bid
              )
            )

            bid_data = BidSerializer.call(
              bid: bid
            )

            content_type :json
            status 201
            bid_data
          else
            status 204
          end
        else
          status 204
        end
      else
        status 204
      end
    end
  end
end
