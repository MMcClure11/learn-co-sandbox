["Red", "Yellow", "Blue"].each do |color|
  puts "There are #{color.length} letters in #{color}"
end 

all_odd = true
[1,2,3].each do |number|
  if number.even? # Will evaluate to false for 1, true for 2, false for 3
    all_odd = false
  end
end
all_odd #=> false

all_odd = [1,3].all? do |number|
  number.odd? # Will evaluate to true for 1, true for 3
end #=> true
all_odd #=> true

[1,3].none?{|i| i.even?} 

<<<<<<< HEAD
[1,2,100].any?{|i| i > 99} 

the_numbers = [4,8,15,16,23,42]
the_numbers.include?(42)   #=> true
the_numbers.include?(6)   #=> false
=======
[1,2,100].any?{|i| i > 99} 
>>>>>>> 63d3759ab636a9395c4bff52db8d836c56f598f1
