class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.boolean :started?, default: false
      t.integer :difficulty

      t.timestamps
    end
  end
end
