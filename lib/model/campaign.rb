class Campaign < ActiveRecord::Base
  belongs_to :seat
  validates_presence_of :seat_id, :name
end
