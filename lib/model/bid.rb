class Bid < Event
  def self.default_scope
    where(type: 'bid')
  end

  def self.inheritance_column
    nil
  end
end
