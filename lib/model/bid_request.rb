class BidRequest
  include ActiveModel::Validations
  include VirtualModel
  include VirtualScopable

  attr_accessor :scope
  attr_accessor :id, :external_id, :timestamp

  def type
    return 'bid_request'
  end
end
