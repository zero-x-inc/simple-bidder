class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements, id: :uuid do |t|
      t.string :campaign_id
      t.string :name
    end
  end
end
