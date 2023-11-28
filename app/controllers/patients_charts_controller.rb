# frozen_string_literal: true

class PatientsChartsController < ApplicationController
  def index
    @chart_data = Patient.group('EXTRACT(YEAR FROM date_of_birth)').count.transform_keys(&:to_i)
  end
end
