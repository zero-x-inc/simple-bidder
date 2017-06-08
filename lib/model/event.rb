class Event < ActiveRecord::Base
  validates_presence_of :timestamp, :exchange_id, :publisher_id
end
