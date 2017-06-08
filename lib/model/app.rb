class App < ActiveRecord::Base
  belongs_to :publisher
  validates_presence_of :external_id
end
