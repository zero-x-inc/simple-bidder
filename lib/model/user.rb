class User < ActiveRecord::Base
  validates_presence_of :exchange_id, :external_id
end
