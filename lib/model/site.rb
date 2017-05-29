class Site < ActiveRecord::Base
  attribute :id, :string
  attribute :external_id, :string
  attribute :exchange_id, :string
  attribute :domain, :string

  validates_presence_of :id, :external_id, :exchange_id, :domain
end
