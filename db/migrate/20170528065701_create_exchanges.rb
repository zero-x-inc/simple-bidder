class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges, id: :uuid do |t|
      t.string :canonical_id
      t.string :name
    end
  end
end
