# frozen_string_literal: true

class Patient < ApplicationRecord
  enum gender: { male: 1, female: 2 }

  validates :first_name, :last_name, :city, :pesel, presence: true
  validates :pesel, uniqueness: true

  before_save :set_personal_data

  private

  def set_personal_data
    self.date_of_birth = BirthdateFromPesel::Parser.new(pesel).birthdate
    self.gender = pesel[9].to_i.even? ? 2 : 1
  end
end
