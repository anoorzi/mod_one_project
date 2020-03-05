require "pry"


Room.destroy_all
User.destroy_all





user1 = User.create(name: "Harry", age: 16, cc: "7252825",bio: "I am a nice guy.",username:"Harry123",password: "pass")
user2 = User.create(name: "Johnson", age: 34, cc: "5275246",bio: "I like long walks on the beach.",username:"Johnson",password:"password")
user3 = User.create(name: "Baker", age: 19, cc: "2365372",bio: "I enjoy the movies.",username:"BakeAlot",password:"12345")
user4 = User.create(name: "Mike", age: 40, cc: "8363537",bio: "I love to surf.",username:"LikeMIke",password:"Mikelike")




room1 = Room.create( country: "united states",city: "new york city", street: "20-10 53 st", price: "600", bio:"lovely view of the city with a heated pool" )
room2 = Room.create( country: "united states",city: "los angeles", street: "150-18 75th ave", price: "900", bio: "one bedroom apartment with hot water" )
room3 = Room.create( country: "canada",city: "toronto", street: "5th ave times square", price: "450", bio:"high tower rise with a downtown view of the city" )
room4 = Room.create( country: "canada",city: "vancover", street: "19th street 23 ave", price: "1600", bio: "nice little ranch with the horses and chickens" )


    binding.pry
    "seed"
