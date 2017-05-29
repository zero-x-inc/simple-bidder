class Device < ActiveRecord::Base
  validates_presence_of :external_id
end
