class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :title, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end