class CreateTicketLines < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_lines do |t|
      t.integer :num_one
      t.integer :num_two
      t.integer :num_three
      t.integer :score
      t.integer :ticket_id
      t.timestamps
    end
  end
end
