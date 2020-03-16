class Baby

attr_accessor :name 

  def initialize(name = nil)
    @name = name
    cry
  end 

  def cry
    puts "Waaaa!!"
  end 

end 

#Ruby reads the entire class once, so by the time it reaches methods it has already read everything, generally the order in which you write methods within the class does not matter 

#1. Make them cry when they are born
#2. Give them a name (through reader/writer)
#3. Allow them to cry through a method cry
#4. Allow names to be optionally set when they are born

north_west = Baby.new 
#=> "Waaaaa!!"
north_west.name = "North West"

blue_ivy = Baby.new
blue_ivy.name = "Blue Ivy"

north_west.name #=> "North West"
blue_ivy.name #=> "Blue Ivy"

north_west.cry #=> "Waaaa!!"
blue_ivy.cry #=> "Waaaaa!!"