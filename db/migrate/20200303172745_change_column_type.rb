class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :rooms, :city, :string

  end
end
