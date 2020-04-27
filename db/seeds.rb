# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  50.times do
    title = Faker::Coffee.blend_name
    description = Faker::Hacker.say_something_smart
    status = 'in_progress'
    delivery_date = Faker::Date.between(from: 20.days.ago, to: Date.today)
    project_id = Faker::Number.within(range: 167..266)
    Task.create(title: title, description: description, status: status, delivery_date: delivery_date, project_id: project_id)
  end
end

100.times do
  name = Faker::Coffee.blend_name
  description = Faker::Hacker.say_something_smart
  status = 'start'
  start_date = Faker::Date.between(from: 50.days.ago, to: Date.today)
  end_date = Faker::Date.between(from: 30.days.ago, to: Date.today)
  internal_demo_date = Faker::Date.between(from: 40.days.ago, to: Date.today)
  Project.create(name: name, description: description, status: status, start_date: start_date, end_date: end_date, internal_demo_date: internal_demo_date)
end
