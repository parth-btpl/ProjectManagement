# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :comments, through: :task
  has_many :users_projects
  has_many :users, through: :users_projects
  accepts_nested_attributes_for :users, allow_destroy: true
  enum status: { start: 0, on_hold: 1, complete: 2 }
  validates :name, :description, :status, :start_date, :end_date, :internal_demo_date, presence: true
  ransack_alias :search, :name
end
