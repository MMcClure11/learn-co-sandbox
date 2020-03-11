name = "Steven"
same_as_name = "Steven"
 
name.object_id == same_as_name.object_id
#=> false
 
# Stored in 2 different locations in memory

puts "Steven".object_id
puts "Steven".object_id
puts "Steven".object_id
 
# > 70236825545220
# > 70236822108160
# > 70236821810060

name = :steven
same_as_name = :steven
name.object_id == same_as_name.object_id
  #=> true
  
  puts :steven.object_id
puts :steven.object_id
puts :steven.object_id
 
# > 1093988
# > 1093988
# > 1093988