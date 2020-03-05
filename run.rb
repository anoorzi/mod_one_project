require 'pry'
require_relative './config/environment'
require_relative "./lib/command_line_interface.rb"
require "tty-prompt"

current_id = startup
temp = create_booking(current_id)
update_user_bio(current_id)
delete_me(temp,current_id)

# "hello"
binding.pry

"hello"

# Booking.all.destroy_all
    



