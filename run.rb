require 'pry'
require_relative './config/environment'
require_relative "./lib/command_line_interface.rb"






#  the_user_id = the current users Id

current_id = startup
create_booking(current_id)
update_user_bio(current_id)
delete_me(current_id)

   binding.pry

    "hello"


    



