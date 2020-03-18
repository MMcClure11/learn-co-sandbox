class Song
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
  end
  
  def self.all #class method for reading the data stored in the class variable @@all, this is a class reader, similar to an instance reader  
    @@all
  end
  
end
###############################################################
#class finders, imagine a Person class that provides acces to all of its instances through the Person.all, instead of writing #find everytime we want to search for an object, we can encapsulate this logic into a class method, like Person.find_by_name
#class methods like Person.find_by_name are 'finders', finder class methods are responsible for finding instances based on some property or condition
#variable names are very low-level abstraction, methods that read out of a variable provide an abstraction for the literal variable name. Using a reader method is almost always better and more reliable than using the variable.

class Person
  attr_accessor :name
  @@people = []
  
  def initialize(name)
    @name = name
    #self in the initialize method is our new instance
    #self.class is Person 
    #self.class.all == Person.all
    self.class.all << self #formerly @@all << self 
  end
  
  def self.all
    @@people
  end
  
  def self.find_by_name(name)
    self.all.find {|person| person.name == name}  
  end
  
end

Person.new("Grace Hopper")
Person.new("Sandi Metz")

Person.find_by_name("Grace Hopper")
#when we use Person.find_by_name the intention of our code is clear, as opposed to iterating over an array. Build objects that provide a semantic and obvious API(interface). Hide the how, show the what.

################################################################

#Custom Class Constructors
#CSV - comma separated values, common formatting convention when exporting from spreadsheets.

class Person
  attr_accessor :name, :age, :company
end

csv_data = "Elon Musk, 45, Tesla
Mark Zuckerberg, 32, Facebook
Martha Stewart, 74, MSL"

rows = csv_data.split("\n")
people = rows.collect do |row|
  data = row.split(", ")
  name = data[0]
  age = data[1]
  company = data[2]
  person = Person.new 
  person.name = name
  person.age = age
  person.company = company
  person
end
people

#this is pretty complex, every time we get a CSV, we want the Person class to be responsible for parsing it. Let's instead build Person.new_from_csv

class Person
  attr_accessor :name, :age, :company
  
  def self.new_from_csv(csv_data)
    rows = csv_data.split("\n") #split the CSV data into an array of individual rows.
    people = rows.collect do |row| #For each row, let's collect a person instance based on the data.
      data = row.split(", ") #Split the row into 3 parts, name, age, company, at the", "
      name = data[0]
      age = data[1]
      company = data[2]
      
      person = self.new #This is an important line. It makes a new instance. self refers to the Person class. This Person.new.
      person.name = name #set the properties on the person
      person.age = age
      person.company = company
      person #return the person to collect
    end
    people #return the array of newly created people
  end
end

csv_data = "Elon Musk, 45, Tesla
Mark Zuckerberg, 32, Facebook
Martha Stewart, 74, MSL"

people = Person.new_from_csv(csv_data)
people #=>[#<Person:0x00000000013344c8 @name="Elon Musk", @age="45", @company="Tesla">, #<Person:0x00000000013342c0 @name="Mark Zuckerberg", @age="32", @company="Facebook">, #<Person:0x00000000013341a8 @name="Martha Stewart", @age="74", @company="MSL">]

new_csv_data = "Avi Flombaum, 31, Flatiron School
Payal Kadakia, 30, ClassPass"

people << Person.new_from_csv(new_csv_data)
people.flatten
people #=>[#<Person:0x00000000013344c8 @name="Elon Musk", @age="45", @company="Tesla">, #<Person:0x00000000013342c0 @name="Mark Zuckerberg", @age="32", @company="Facebook">, #<Person:0x00000000013341a8 @name="Martha Stewart", @age="74", @company="MSL">, [#<Person:0x000000000139c4b0 @name="Avi Flombaum", @age="31", @company="Flatiron School">, #<Person:0x000000000139c398 @name="Payal Kadakia", @age="30", @company="ClassPass">]]


#anything we build into initialize will always happen. Key to writing maintainable code: designing functionality that is closed to modification but open to extension
#initialize should be closed to modification, if we need more functionality when making an instance, instead of modifying initialize, we can extend it by wrapping it within a custom constructor 

#########################################################################
#simpler example of a Custom Constructor that wraps .new, When building objects that can be saved into a class variable @@aall, we might not always want to save the newly instantiated instance

class Person
  @@all = []
 
  def initialize
    @@all << self
  end
end
#with this, no matter what, person instances will always be saved

class Person
  @@all = []
 
  def self.create
    @@all << self.new
  end
end
#here we use a .create class method to provide the functionality of instantiating and creating the instance, leaving the .new funtion as normal 

#################################################################

#Class Operators, class methods can also manipulate class-level data
#let's print all the people in our application by encapsulating the logic within a class method .print_all

class Person
  attr_accessor :name
  
  @@all = []
  
  def self.all
    @@all
  end 
  
  def self.create(name)
    person = self.new
    person.name = name
    @@all << person
  end    
    
  def self.print_all
    self.all.each{|person| puts "#{person.name}"}
  end
    
end

Person.create("Ada Lovelace")
Person.create("Grace Hopper")

Person.print_all
#Ada Lovelace
#Grace Hopper
#=> [#<Person:0x0000000001002520 @name="Ada Lovelace">, #<Person:0x000000000100a130 @name="Grace Hopper">]

###############################################################
#Class Operators, build a class method so that the incoming csv with people's names in lowercase letters are converted to proper capitalization. build class method Person.normalize_names

class Person 
  attr_accessor :names
  @@all = []
  def self.all
    @@all
  end 
  
  def initialize(name)
    @name = name
    @@all << self
  end

  def normalize_names
    self.name.split(" ").collect{|w| w.capitalize}.join(" ")
    end
  
   def self.normalize_names
    self.all.each do |person|
      person.name = person.normalize_name
    end
  end
    
end

#the logic for normalizing a person's names is pretty complex: we're doing is splitting a name, like "ada lovelace", into an array at the space, " ", returning ["ada", "lovelace"]. With that array we collect each word into a new array after it has been capitalized, returning ["Ada", "Lovelace"]. We then join the elements in that array with a " " returning the final capitalized name, "Ada Lovelace".
###########################################################
#Person.destroy_all will clear out the @@all array
class Person
  attr_accessor :name
  @@all = []
  def self.all
    @@all
  end
 
  def initialize(name)
    @name = name
    @@all << self
  end
 
  def self.destroy_all
    self.all.clear
  end
end






