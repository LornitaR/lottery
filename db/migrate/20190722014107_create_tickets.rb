class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :num_one
      t.integer :num_two
      t.integer :num_three
      t.integer :score

      t.timestamps
    end
  end
end
