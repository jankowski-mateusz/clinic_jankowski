class CreateAppointment < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time, null: false
      t.decimal :price, null: false
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
