class Advertisement < ActiveRecord::Base
  validates_presence_of :campaign_id, :name
end
