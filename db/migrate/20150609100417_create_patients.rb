class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.date :date_of_birth
      t.string :contact_number

      t.timestamps null: false
    end
  end
end
