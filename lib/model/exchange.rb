class Exchange < ActiveRecord::Base
  validates_presence_of :name, :canonical_id
end
