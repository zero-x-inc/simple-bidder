class App < ActiveRecord::Base
  validates_presence_of :external_id, :exchange_id, :publisher_id
end
