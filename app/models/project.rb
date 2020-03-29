class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  enum status: { start: 0, on_hold: 1, complete: 2 }
end
