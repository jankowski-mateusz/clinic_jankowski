# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new
  end
end
