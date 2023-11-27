# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_patient, only: %i[index new]

  def index
    @q = patient.appointments.ransack(params[:q])
    @pagy, @appointments = pagy(@q.result)
  end

  def new
    @appointment = Appointment.new
  end

  private

  attr_reader :patient

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
end
