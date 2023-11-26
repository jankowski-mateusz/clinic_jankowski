# frozen_string_literal: true

class Patient < ApplicationRecord
  enum gender: { male: 1, female: 2 }

  validates :first_name, :last_name, :city, :pesel, presence: true
  validates :pesel, uniqueness: true

  before_save :set_personal_data

  broadcasts_to ->(_patient) { 'patients' }

  def self.ransackable_attributes(_auth_object = nil)
    %w[gender last_name pesel date_of_birth]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  ransacker :gender, formatter: proc { |v| genders[v] } do |parent|
    parent.table[:gender]
  end

  private

  def set_personal_data
    self.date_of_birth = BirthdateFromPesel::Parser.new(pesel).birthdate
    self.gender = pesel[9].to_i.even? ? 2 : 1
  end
end
