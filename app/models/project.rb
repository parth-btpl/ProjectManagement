# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :comments, through: :task
  enum status: { start: 0, on_hold: 1, complete: 2 }
  validates :name, :description, :status, :start_date, :end_date, :internal_demo_date, presence: true
  ransack_alias :search, :name

  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |project|
        csv << project.attributes.values_at(*fields)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      project_hash = row.to_hash
      project = find_or_create_by!(name: project_hash['name'], description: project_hash['description'], status: project_hash['status'], start_date: project_hash['start_date'], end_date: project_hash['end_date'], internal_demo_date: project_hash['internal_demo_date'])
      project.update(project_hash)
    end
  end
end
