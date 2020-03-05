class CreateRooms < ActiveRecord::Migration[6.0]
  def change

    create_table :rooms do |t|
      t.string :country
      t.integer :city
      t.string :price
      t.string :bio
    
    end
  
  end
end
