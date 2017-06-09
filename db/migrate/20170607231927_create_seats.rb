class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats, id: :uuid do |t|
      t.string :email
    end
  end
end
