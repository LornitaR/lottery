class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets, id: false do |t|
      t.primary_key :ticket_id

      t.timestamps
    end
  end
end
