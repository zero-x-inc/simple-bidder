class Event < ActiveRecord::Base
  belongs_to :seat
  belongs_to :campaign
  belongs_to :advertisement
  belongs_to :exchange
  belongs_to :publisher
  belongs_to :app
  belongs_to :site
  belongs_to :device
  belongs_to :user
  validates_presence_of :timestamp, :exchange, :publisher

  def self.inheritance_column
    nil
  end
end
