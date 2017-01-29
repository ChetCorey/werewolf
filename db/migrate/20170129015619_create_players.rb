class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :role
      t.integer :position

      t.timestamps
    end
  end
end
