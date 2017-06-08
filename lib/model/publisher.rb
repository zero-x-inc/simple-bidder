class Publisher < ActiveRecord::Base
  belongs_to :exchange
  has_many :apps
  validates_presence_of :external_id, :exchange_id
end
