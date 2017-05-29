class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers, id: :uuid do |t|
      t.string :external_id
      t.string :exchange_id
      t.string :name
    end
  end
end
