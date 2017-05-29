class BidRequest
  include ActiveModel::Validations
  include VirtualModel

  attr_accessor :id, :external_id, :exchange, :publisher, :app, :site, :location,
                :device, :slot, :user, :timestamp
end
