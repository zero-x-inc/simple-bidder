class Scope
  include ActiveModel::Validations
  include VirtualModel

  attr_accessor :exchange, :publisher, :app, :site, :location,
                :device, :slot, :user, :bid_request, :seat, :bid,
                :campaign, :advertisement
end
