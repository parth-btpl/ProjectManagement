# frozen_string_literal: true

class Task < ApplicationRecord
  enum status: { to_do: 0, in_progress: 1, dev_done: 2, ready_for_testing: 3 }
  belongs_to :project
  has_many :comments, dependent: :destroy
  validates :title, :description, :status, :delivery_date, presence: true
  ransack_alias :search, :title_or_description
  # has_many_attached :pictures, through: :comments
end
