class PatientsController < ApplicationController
  def index
    @pagy, @patients = pagy(Patient)
  end
end
