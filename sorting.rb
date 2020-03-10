dishes = ["steak", "apple pie", "vegetable soup"]

 #dishes.sort.reverse  
 
 dishes.sort do |a, b|
   a <=> b 
 end 

# dishes.sort do |a, b|
#   b <=> a  #this will also reverse .sort 
# end 


# array = [7, 3, 1, 2, 6, 5]
 
# array.sort do |a, b|
#   if a == b
#     0
#   elsif a < b
#     -1
#   elsif a > b
#     1
#   end
# end

# array.sort do |a, b|
#   a <=> b
# end
 