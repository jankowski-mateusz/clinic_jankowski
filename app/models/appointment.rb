# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :patient, counter_cache: :appointments_count
  belongs_to :doctor

  def self.ransackable_attributes(_auth_object = nil)
    []
  end

  validate :valid_appointment_time, :no_overlapping_visits

  def valid_appointment_time
    return if (8..16).cover?(appointment_time.hour) &&
              (1..5).cover?(appointment_time.wday) &&
              [0, 20, 40].include?(appointment_time.min)

    errors.add(:base, 'Invalid appointment time')
  end

  def no_overlapping_visits
    overlapping_appointment = Appointment.find_by(
      appointment_time: appointment_time.beginning_of_minute..appointment_time.end_of_minute,
      doctor:
    )

    errors.add(:base, 'Visits cannot overlap for the same doctor') if overlapping_appointment
  end
end
