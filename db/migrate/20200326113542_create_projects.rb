class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :internal_demo_date

      t.timestamps
    end
  end
end
