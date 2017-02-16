class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :step_order
      t.text :content

      t.timestamps null: false
    end
  end
end
