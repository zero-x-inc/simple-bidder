class Exchange < ActiveRecord::Base
  has_many :publishers
  validates_presence_of :name, :canonical_id
end
