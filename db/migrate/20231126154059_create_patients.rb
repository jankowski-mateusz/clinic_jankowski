class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :pesel, null: false
      t.string :city, null: false
      t.integer :gender
      t.date :date_of_birth

      t.timestamps
      t.index :pesel, unique: true
    end
  end
end
