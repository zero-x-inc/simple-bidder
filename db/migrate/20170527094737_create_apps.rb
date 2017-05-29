class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps, id: :uuid do |t|
      t.string :external_id
      t.string :publisher_id
      t.string :exchange_id
      t.string :domain
      t.string :name
    end
  end
end
