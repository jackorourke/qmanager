class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :name
      t.string :contact_number
      t.integer :age
      t.timestamp :time
      t.text :symptoms
      t.integer :travel_time

      t.timestamps null: false
    end
  end
end
