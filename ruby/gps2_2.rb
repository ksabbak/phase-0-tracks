# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # turn the string into an array (using split)
  # set default quantity - default quantity is 1
  # print the list to the console (call the print method)
# output: hash where keys = food and values = quantity

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: add item name to list as key 
# 		 and quantity as value (set value to one if not provided)
# output: Maybe the updated hash? Not 100% needed.

# Method to remove an item from the list
# input: list, item name
# steps: delete the key from the hash
# output: Maybe the updated hash? 

# Method to update the quantity of an item
# input: list, item name, new quantity
# steps: update the corresponding value to the item key
# output: Maybe the updated hash?

# Method to print a list and make it look pretty
# input: list
# steps: iterate through the list and update a string, it'll be nice.
# output: the string
class GroceryList
	attr_reader :list

	def initialize(list_string)
		items = list_string.split(" ")
		@list = {}
		items.each do |item|
			@list[item.downcase] = 1
		end
		print_list
		@list
	end

	def add_item(item, value = 1)
		@list[item.downcase] = value
	end

	def remove_item(item)
		@list.delete(item.downcase)
	end

	def update_quantity(item, new_quant)
		@list[item] = new_quant
	end

	def print_list
		puts "Your grocery list is below:"
		@list.each do |item, quantity|
			puts "#{item.capitalize}: #{quantity}"
		end
		puts "Happy shopping!"

	end
end


new_list = GroceryList.new("carrots apples cereal pizza")
new_list.add_item("avocado", 6)
# print_list(new_list)
p "*******************************"
p new_list.add_item("grape")
p "*******************************"
# print_list(new_list)
new_list.remove_item("carrots")
# print_list(new_list)
new_list.update_quantity("apples", 10)
new_list.print_list


# # What did you learn about pseudocode from working on this challenge?
# 	That it's more useful than I've been treating it, but also to use it as a guide
# 	and that I don't have to think through the whole thing before pseudocoding, it's
# 	okay if things change.
# # What are the tradeoffs of using arrays and hashes for this challenge?
# 	You'd have to use multiple arrays to do the array properly (array of arrays
# 	or even two arrays that are separate, but that'd be a mess because then if the 
# 	indexes end up off, everything is sad), hashes seem ideal for this challenge tbh.
# # What does a method return?
# 	The last evaluated expression. We mostly ignored our method returns just because 
# 	the way hashes work with pointers and so forth, so *shrug*
# # What kind of things can you pass into methods as arguments?
# 	Objects. All sorts of objects. 
# # How can you pass information between methods?
# 	Well, you can pass them in, or you can have a variable that covers both their 
# 	scopes (i.e. the instance variable we used when we modded this to work with a class
# 	or a global var but we all know that's trash).
# # What concepts were solidified in this challenge, and what concepts are still confusing?
# 	This challenge was a nice review of week 5. I don't think I'm confused about anything.