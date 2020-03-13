class Dog 
end 

fido = Dog.new 
fido.object_id 

"Strings are instances and objects too".reverse


class Dog
  # Class body
 
  # Instance Method Definition
  def bark
    puts "Woof!"
  end
end
 
fido = Dog.new
fido.bark #> "Woof!"

snoopy = Dog.new
snoopy.bark #> "Woof!"