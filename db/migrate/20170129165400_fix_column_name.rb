class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :players, :name, :firstname
    add_column :players, :lastname, :string
  end
end
