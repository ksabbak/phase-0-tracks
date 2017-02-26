

design_profile = {}



puts "Please enter the following:"

puts "Name:"
name = gets.chomp
design_profile[:name] = name 

puts "Age:"
age = gets.chomp
design_profile[:age] = age.to_i

puts "Number of children:"
children_total = gets.chomp.to_i
design_profile[:children] = children_total

puts "Favorite design style:"
favorite = gets.chomp
design_profile[:favorite_style] = favorite

puts "Least favorite design style"
hate = gets.chomp
design_profile[:least_favorite_style] = hate

puts "Approximate number of square feet:"
size = gets.chomp.to_i
design_profile[:square_feet] = size

puts "Budget: "
budget = gets.chomp.to_i
design_profile[:budget] = budget

puts "Has IKEA furniture: "
ikea = gets.chomp
if (ikea != "n") && ("yes yeah definitely affirmative true".include? ikea) 
	has_ikea = true
else
	has_ikea = false
end
design_profile[:ikea_furniture] = has_ikea

p design_profile