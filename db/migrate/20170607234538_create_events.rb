class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, id: :uuid do |t|
      t.string :type
      t.string :seat_id
      t.string :campaign_id
      t.string :advertisement_id
      t.string :bid_request_id
      t.string :exchange_id
      t.string :publisher_id
      t.string :app_id
      t.string :site_id
      t.string :device_id
      t.string :user_id
      t.string :country
      t.string :region
      t.string :city
      t.string :dimension
      t.string :make
      t.string :model
      t.string :os
      t.string :osv
      t.string :js
      t.string :dimension
      t.string :gender
      t.string :yob
      t.integer :cost
      t.integer :price
      t.timestamp :timestamp
    end
  end
end
