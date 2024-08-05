class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :priority, default: 1, null: false
      t.boolean :is_complete, default: false, null: false
      t.string :tags, array: true, default: []

      t.belongs_to :board, null: false, foreign_key: true
      t.timestamps
    end
  end
end
