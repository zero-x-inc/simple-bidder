class Advertisement < ActiveRecord::Base
  belongs_to :campaign
  validates_presence_of :campaign_id, :name, :dimension, :content
end
