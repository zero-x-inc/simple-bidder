class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites, id: :uuid do |t|
      t.string :external_id
      t.string :publisher_id
      t.string :exchange_id
      t.string :domain
    end
  end
end
