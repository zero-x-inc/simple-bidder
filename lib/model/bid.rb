class Bid < Event
  validates_presence_of :seat, :campaign, :advertisement,
                        :bid_request_id

  def self.default_scope
    where(type: 'bid')
  end

  def self.inheritance_column
    nil
  end
end
