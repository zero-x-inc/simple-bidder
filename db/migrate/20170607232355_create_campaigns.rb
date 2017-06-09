class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns, id: :uuid do |t|
      t.string :seat_id
      t.string :name
    end
  end
end
