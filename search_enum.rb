["Red", "Yellow", "Blue"].each do |color|
  puts "There are #{color.length} letters in #{color}"
end #=> ["Red", "Yellow", "Blue"]

[1,2,3,4,5].select do |number|
  number.even?
end #=> [2,4]

[1,2,3,4,5].select{|i| i.odd?} #=> [1,3,5]
[1,2,3].select{|i| i.is_a?(String)} #=> []

[1,2,3].detect{|i| i.odd?} #=> 1

[1,2,3,4].detect{|i| i.even?} #=> 2
[1,2,3,4].detect{|i| i.is_a?(String)} #=> nil

[1,2].reject{|i| i.even?} 