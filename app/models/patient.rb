class Patient < ApplicationRecord
  include Activepesel::PeselAttr
  pesel_attr :pesel

  enum gender: { male: 1, female: 2 }

  validates :first_name, :last_name, :city, presence: true
  validates :pesel, pesel: true, uniqueness: true

  before_save :set_personal_data

  private

  def set_personal_data
    self.date_of_birth = pesel_personal_data.date_of_birth
    self.gender = pesel_personal_data.sex
  end
end
