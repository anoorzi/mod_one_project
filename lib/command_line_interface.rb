require "tty-prompt"
require "pry"
def check_country
    prompt = TTY::Prompt.new

    unique_country = []
    Room.all.each do |obj|
        unique_country << obj.country
    end
    unique_country = unique_country.uniq
    
    puts " "
    puts "Avalible Countries are:"

    room_country = prompt.select("Which country are you booking a room in?",unique_country)
    
    Room.all.select do |room_obj|
        room_obj["country"]== room_country 
    end
end


def check_city(country_list) 
    prompt = TTY::Prompt.new

    unique_city = []
    country_list.each do |obj|
        unique_city << obj.city
    end
    unique_city = unique_city.uniq
    
    puts " "
    puts "Avalible Cities are:"

    room_city = prompt.select("Which city are you booking a room in?",unique_city)

    # unique_city.each do |obj|
    #     puts obj
    # end
    
   
    
    # puts "Which city are you booking in?"
    # room_city = gets.chomp

    country_list.select do |obj| 
        obj["city"] == room_city 
    end
end

def make_choice(check_city_val)
    prompt = TTY::Prompt.new

    check_city_val.each do |obj|
        puts " "
        puts "Room ID Number: "+ obj.id.to_s
        puts obj.street
        puts obj.bio
    end

    puts " "
    puts "Enter desired locations room ID"
    room_choice_id = gets.chomp.to_i

    check_city_val.find do |obj|
        check_city_val[0]["id"]==room_choice_id
    end
    room_choice_id
end

def sign_up
    prompt = TTY::Prompt.new

    puts "Create a username"
    username = gets.chomp

    password = prompt.mask("Create a password")
    # puts "Create a password"
    # password = gets.chomp
    
    puts "What is your name?" 
    user_name = gets.chomp

    puts "What is your age?" 
    user_age = gets.chomp

    puts "What is your Credit Card Number?" 
    user_cc = gets.chomp

    puts "Tell us a little something about yourself?" 
    user_bio = gets.chomp

    user_in = User.create(name: user_name, age: user_age.to_i, cc: user_cc ,bio: user_bio, username: username, password: password)
    user_in.id

end


def login 
    prompt = TTY::Prompt.new

    puts "Enter username"
    user_name = gets.chomp

    user_password = prompt.mask("Enter Password")
    # puts "Enter password"
    # user_password = gets.chomp
    main_user = User.all.find do |obj|
                obj["username"] == user_name && obj["password"] == user_password
                 end
    main_user.id
end

def create_booking(user_id)
    
    var = check_country
    var2 = check_city(var)
    var3 = make_choice(var2)

    puts "enter desired checkin date YYYY-MM-DD" 
    cin = gets.chomp
    cin_date = Date.parse cin
    
    puts "enter desired check out date YYYY-MM-DD" 
    cout = gets.chomp
    cout_date = Date.parse cout
    
    bool = checks_dates(var3,cin_date,cout_date)

    if bool == false
        b1 = Booking.create(user_id: user_id ,room_id: var3,check_in: cin_date, check_out: cout_date)
    else 
        puts "Reservation failed. Date already booked!"
    end

    bool

   
end

def checks_dates(room_id,desired_checkin,desired_checkout)
    boolean = false
    Booking.where(room_id: room_id).each do |obj|
        if desired_checkin.between?(obj.check_in, obj.check_out) || desired_checkout.between?(obj.check_in, obj.check_out) 
            boolean = true
            break
        end
    end
    boolean

end

def update_user_bio(user_id)
    prompt = TTY::Prompt.new
    bio_ans= prompt.select("Would you like to update your bio", %w(Yes No))

    if bio_ans == "Yes"
        puts "Enter new bio"
        new_bio = gets.chomp
        User.update(user_id, :bio => new_bio)
    end
    
end

def get_user(user_id)
    User.all.find do |obj_user|
        obj_user[:id] == user_id
    end

end



def startup
    while true do
        prompt = TTY::Prompt.new
        user_input = prompt.select("Would you like to login or signup", %w(Login Signup))
        # puts "Would you like to login or signup?"
        # user_input = gets.chomp

         if user_input == "Login"
             the_user_id = login
             break
          elsif user_input == "Signup" 
          the_user_id = sign_up
         break
         end

    end
    the_user_id
end

def delete_me(bool,user_id)
    if bool == false
        prompt = TTY::Prompt.new
    
        user_input = prompt.select('Would you like to cancel your last reservation?', %w(Yes No))

        if user_input == "Yes"
             Booking.where(user_id: user_id).last.destroy
        end
    end
end


