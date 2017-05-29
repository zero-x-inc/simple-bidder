class Publisher < ActiveRecord::Base
  validates_presence_of :external_id, :exchange_id
end
