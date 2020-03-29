class Task < ApplicationRecord
  enum status: { start: 0, on_hold: 1, complete: 2 }
  belongs_to :project
end
