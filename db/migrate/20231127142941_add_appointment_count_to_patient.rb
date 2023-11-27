class AddAppointmentCountToPatient < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :appointments_count, :integer, default: 0
  end
end
