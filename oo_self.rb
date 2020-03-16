class Dog
  def showing_self
    puts self #the self keyword refers to the instance, or object, that the #showing_self method is being called on
  end
end

class Dog

  attr_accessor :name, :owner
  
  def initialize(name)
    @name = name
  end
  
  def bark
    "Woof!"
  end
  
  def get_adopted(owner_name)
    self.owner = owner_name
  end
  
end

#fido = Dog.new("Fido") => #<Dog:0x0000000001278188 @name="Fido">
#fido.owner = "Sophie" => "Sophie"
#fido.owner => "Sophie"