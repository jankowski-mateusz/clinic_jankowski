# frozen_string_literal: true

require 'csv'

namespace :import_patients do
  task from_csv: :environment do
    file = Rails.root.join('fake_medical_patients.csv').to_s
    opened_file = File.open(file)
    options = { headers: true, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      patient_hash = {}
      patient_hash[:first_name] = row['first_name']
      patient_hash[:last_name] = row['last_name']
      patient_hash[:pesel] = row['pesel']
      patient_hash[:city] = row['city']

      Patient.find_or_create_by!(patient_hash)
      # TODO: This could be done in job to improve performance.
      # TODO:Also we can add code to display error if we got invalid data
    end
  end
end
