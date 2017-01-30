class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :role
      t.integer :position
      t.string :color
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
