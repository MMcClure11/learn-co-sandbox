# instructors = ["Avi", "Jeff", "Rose"]

# dev_team = ["Jonas", "Logan", "Amanda", "Seiji", "Kate", "Spencer"]

# #instead of having two separate arrays, we want them together with their key under the hash faltiron_school since they are both subsets

# flatiron_school = { instructors: ["Avi", "Jeff", "Rose"], dev_team: ["Jonas", "Logan", "Amanda", "Seiji", "Kate", "Spencer"]}
#this is a hash in which the value of a key is an array 

flatiron_school = {instructors: ["Avi", "Jeff", "Rose"], dev_team: ["Jonas", "Logan", "Amanda", "Seiji", "Kate", "Spencer"], students: ["Sarah", "you", "John", "David"]}
#each key point to an array of names
#to access a key we use the [] helper_method

instructors = flatiron_school[:instructors]
#=>["Avi", "Jeff", "Rose"]
instructors[0]
#=> "Avi"