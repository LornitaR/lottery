class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.timestamps
      t.boolean :status_checked, :default => false
    end
  end
end
