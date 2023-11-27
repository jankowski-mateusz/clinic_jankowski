# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :patient, counter_cache: :appointments_count
  belongs_to :doctor

  def self.ransackable_attributes(auth_object = nil)
    []
  end
end
