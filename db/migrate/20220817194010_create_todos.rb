class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :description
      t.boolean :complete, :default => false
      
      t.timestamps
    end
  end
end
