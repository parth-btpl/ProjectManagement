class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :status
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
