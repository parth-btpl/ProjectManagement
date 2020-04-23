# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  enum status: { start: 0, on_hold: 1, complete: 2 }
  validates :name, :description, :status, :start_date, :end_date, :internal_demo_date, presence: true
end
