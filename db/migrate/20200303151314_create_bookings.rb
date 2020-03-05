class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :room_id
      t.integer :user_id
      t.string :check_in
      t.string :check_out
      
    end
  
  end
end
