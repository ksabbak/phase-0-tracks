# Psuedocode
# - create a method that takes a list of integers, a number
# - search the list for the number
# - if the number is found say what position it was 
# - if not sad face

# Release 0: Business Logic

def find_the_int(array, integer)
	position = 0
	found_places = []

	array.each do |check_number|
		if integer == check_number 
			found_places << position
		end
		position += 1
	end
	
	if found_places.length > 0 
		return found_places
	else 
		return nil
	end
end


# p find_the_int([1, 2, 3, 6, 45, 78, 3], 78)

# p find_the_int([1, 2, 3, 6, 45, 78, 3], 52)

# p find_the_int([1, 2, 3, 6, 45, 78, 3], 3)


# Release 1

# - define first two values in fib sequence 
# 	- first position = 0
# 	- second position = 1
# - take previous two values, add them together to create following value

# Business Logic

def fib(x)
	fib_numbers = [0,1]
	position = 0
	# position_one = 0
	# position_two = 1
	while fib_numbers.length < x 
		fib_numbers << fib_numbers[position] + fib_numbers[position + 1]
		position += 1
	end
	fib_numbers[0...x]
end

# p fib(100)

# p fib(100).last

# p 218922995834555169026

# p fib(100).last == 218922995834555169026

# p fib(1)

#Release 2
#psuedocode 
# - create array 
# - use bubble method to sort 
# 	- evaluate values at position 0 & 1
# 		- if correct order, leave alone
# 		- if incorrect order, switch positions
# 	- loop through this process until all values are at the correct position 

#Business Logic 

def bubble_method(array)
	position = 0 
	change = true


	while change 
		change = false
		while position < array.length - 1 
			
			if array[position] > array[position + 1]
				swap_1 = array[position]
				swap_2 = array[position + 1]
				array[position] = swap_2
				array[position + 1] = swap_1
		 		change = true
		 	end
		 	position += 1
		end
		position = 0
	end
	array 
end
unsorted_array = [1, 2, 3, 5, 77, 76, 75, 4]

p bubble_method(unsorted_array)
