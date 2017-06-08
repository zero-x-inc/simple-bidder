class User < ActiveRecord::Base
  belongs_to :exchange
  validates_presence_of :exchange_id, :external_id
end
