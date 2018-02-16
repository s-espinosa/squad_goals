class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :focus_area
      t.integer :level
      t.string :description
    end
  end
end
