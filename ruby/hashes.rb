

$design_profile = {}

def get_name
	puts "Name:"
	name = gets.chomp
	$design_profile[:name] = name 
end

def get_age
	puts "Age:"
	age = gets.chomp
	$design_profile[:age] = age.to_i
end

def get_children_count
	puts "Number of children:"
	children_total = gets.chomp.to_i
	$design_profile[:children] = children_total
end

def get_fav_style
	puts "Favorite design style:"
	favorite = gets.chomp
	$design_profile[:favorite_style] = favorite
end

def get_least_fav_style
	puts "Least favorite design style"
	hate = gets.chomp
	$design_profile[:least_favorite_style] = hate
end

def get_size
	puts "Approximate number of square feet:"
	size = gets.chomp.to_i
	$design_profile[:square_feet] = size
end

def get_budget
	puts "Budget: "
	budget = gets.chomp
	$design_profile[:budget] = "$ #{budget}"
end

def get_ikea
	puts "Has IKEA furniture: "
	ikea = gets.chomp
	if (ikea != "n") && ("yes yeah definitely affirmative true".include? ikea) 
		has_ikea = true
	else
		has_ikea = false
	end
	$design_profile[:ikea_furniture] = has_ikea
end


puts "Please enter the following:"

get_name
get_age
get_children_count
get_fav_style
get_least_fav_style
get_budget
get_size
get_ikea


$design_profile.each do |key, value|
	string_key = key.to_s.sub(/[_]/, " ").capitalize
	puts "#{string_key}: #{value}"
end




p $design_profile


