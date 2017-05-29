class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, id: :uuid do |t|
      t.string :js
      t.string :os
      t.string :osv
      t.string :make
      t.string :model
      t.string :external_id
    end
  end
end
