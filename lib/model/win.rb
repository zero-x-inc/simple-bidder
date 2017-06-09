class Win < Event
  validates_presence_of :seat, :campaign, :advertisement,
                        :bid_request_id, :price

  def self.default_scope
    where(type: 'win')
  end

  def self.inheritance_column
    nil
  end
end
