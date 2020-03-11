jon_snow = {name: "Jon", email: "jon_snow@thewall.we"} #single level hash 


contacts = {
  "Jon Snow" => {
    name: "Jon",
    email: "jon_snow@thewall.we",
    favorite_ice_cream_flavors: ["chocolate", "vanilla"]  },
  "Freddy Mercury" => {
    name: "Freddy",
    email: "freddy@mercury.com",
    favorite_ice_cream_flavors: ["strawberry", "cookie dough", "mint chip"]
  }
}

#to access the array of ice cream flavors, use its key
contacts["Jon Snow"][:favorite_ice_cream_flavors]
#=> ["chocolate", "vanilla"]

#to add a flavor to the list, use the shovel method to add an item to the array 
#option 1 
contacts["Jon Snow"][:favorite_ice_cream_flavors] << "mint chip"
#option 2 
jon_snow = contacts["Jon Snow"]
jons_fav_ice_cream = jon_snow[:favorite_ice_cream_flavors]
jons_fav_ice_cream << "mint chip"

puts contacts

#add new key/value pair of Jon's address
contacts["Jon Snow"][:address] = "The Lord Commander's Room, The Wall, Westeros"

puts contacts 