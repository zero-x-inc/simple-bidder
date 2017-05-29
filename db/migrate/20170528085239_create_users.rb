class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :exchange_id
      t.string :external_id
      t.string :gender
      t.string :yob
    end
  end
end
