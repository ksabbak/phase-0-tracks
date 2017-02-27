# Ask user for name, age, number of kids, fave design style, least fav design style, square feet, budget, ikea furniture
# get from user the data asked for
# assign data to a list 
# print list
# ask if list is okay
#  if not okay
#  	ask what's wrong
#  	get what's wrong
#  	change list
#  	show new list
#  if okay then we're good.



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
	$design_profile[:budget] = "$#{budget}"
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

def check_data
	puts "Does this look right?"
verify = gets.chomp
if (verify != "n") && ("yes yeah definitely affirmative true".include? verify) 
		puts "Great, have a nice day."
		return true
	else
		puts "What would you like to change?"
		change = gets.chomp.downcase.gsub(" ", "_").intern
		case change
		when :name
			get_name
		when :age
			get_age
		when :children
			get_children_count
		when :favorite_style
			get_fav_style
		when :least_favorite_style
			get_least_fav_style
		when :budget
			get_budget
		when :ikea_furniture
			get_ikea
		else
			puts "Something went wrong, please try again."
		end
	end
	print_hash
	return false
end

def print_hash
	$design_profile.each do |key, value|
	string_key = key.to_s.gsub(/[_]/, " ").capitalize
	puts "#{string_key}: #{value}"
	end
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

print_hash

all_clear = false

until all_clear
	all_clear = check_data
end

