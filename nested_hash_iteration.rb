contacts = {
  "Jon Snow" => {
    name: "Jon",
    email: "jon_snow@thewall.we", 
    favorite_ice_cream_flavors: ["chocolate", "vanilla", "mint chip"],
        knows: nil
  },
  "Freddy Mercury" => {
    name: "Freddy",
    email: "freddy@mercury.com",
    favorite_ice_cream_flavors: ["strawberry", "cookie dough", "mint chip"]
  }
}

# contacts.each do |person, data|
#   puts "#{person}: #{data}"
# end

# contacts.each do |person, data|
#   #at this level, "person" is Jon Snow or Freddy Mercury and "data" is a hash of key/value pairs
#   #to iterate over the "data" hash, we can use the following line: 
 
#   data.each do |attribute, value|
#     puts "#{attribute}: #{value}"
#   end
# end

contacts.each do |person, data|
  #at this level, "person" is Jon Snow or Freddy and "data" is a hash of key/value pairs
  #to iterate over the "data" hash, we can use the following line: 
 
  data.each do |attribute, value|
     #at this level, "attribute" describes the key of :name, :email, :favorite_ice_cream_flavors, or :knows
    #we need to first check and see if the key is :favorite_ice_cream_flavors,
    #if it is, that means the VALUE is an array that we can iterate over to print out each element
    if attribute == :favorite_ice_cream_flavors
      value.each do |flavor|
        # here, each index element in an ice cream flavor string
        puts "#{flavor}"
      end
    end
  end
end