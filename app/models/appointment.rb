class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
  delegate :name, :to => :physician, :allow_nil => true, :prefix => true
  delegate :name, :to => :patient, :allow_nil => true, :prefix => true
end