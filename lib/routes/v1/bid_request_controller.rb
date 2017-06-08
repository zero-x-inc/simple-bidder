module V1
  class BidRequestController < SimpleBidderApp
    post '/:exchange_id' do
      data = JSON.parse(request.env['rack.input'].read).merge(
        {
          'exchange_id' => params['exchange_id']
        }
      )

      bid_request = BidRequestLoader.call(data: data)

      if bid_request.present?
        RealtimeSender.call(
          data: BidRequestSerializer.call(
            bid_request: bid_request
          )
        )

        advertisement = Targeter.call(
          bid_request: bid_request
        )

        if advertisement.present?
          bid = Bidder.call(
            advertisement: advertisement,
            bid_request: bid_request
          )

          if bid.present? && bid.persisted?
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
