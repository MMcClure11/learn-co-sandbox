# mantra = ["Don't", "Repeat", "Yourself"]
 
# mantra.map do |word|
#   word[0]
# end
 
# #=> ["D", "R", "Y"]
 
 class Person
 
  attr_reader :name
  attr_writer :name
 
end

jay_z = Person.new 
jay_z.name = "Shawn Carter"
jay_z.name 

#macros

# class Person
#   attr_writer :name
#   attr_reader :name
 
# end

#explicit method definitions 

# class Person
 
#   def name=(name)
#     @name = name
#   end
 
#   def name
#     @name
#   end
# end

#if we are going to be reading and writing to the name attribure on our Person calss, we can use another macro called an attribute accessor 
class Person
  attr_writer :name 
  attr_reader :name
end 
#can be written like this 

class Person
  attr_accessor :name
  
end 

#using macros is generally preferred over the explicit definition of setter and getter methods, unless you need to customize the implementation of a method 