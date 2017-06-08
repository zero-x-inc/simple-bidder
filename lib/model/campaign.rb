class Campaign < ActiveRecord::Base
  validates_presence_of :seat_id, :name
end
