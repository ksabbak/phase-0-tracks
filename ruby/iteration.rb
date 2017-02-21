#RELEASE 1

neighborhoods = ["wicker park", "andersonville", "lake view", "lincoln park", "the loop"]
bars = {wicker_park: "handlebar", lincoln_park: "blues", andersonville: "hopleaf", lake_view: "tavern", the_loop: "bar louie"}

neighborhood_string = "Neighborhoods in Chicago include: "

#Not a WONDERFUL example, but a way to show how to effect something with .each
neighborhoods.each do |neighborhood|
	neighborhood_string += "#{neighborhood}, "
end

puts neighborhood_string

bars.each do |neighborhood, bar|
	puts "A bar in #{neighborhood.to_s.sub(/[_]/, " ")} is #{bar}"
end

#Capitalize each word
p neighborhoods
neighborhoods.map! do |neighborhood| 
	words = neighborhood.split
	words.map! do |word|
		word.capitalize
	end
	neighborhood = words.join(" ")
end
p neighborhoods


#RELEASE 2

#1
# neighborhoods.delete_if do |neighborhood|
# 	neighborhood.include? " "
# end
# p neighborhoods

# bars.delete_if do |neighborhood, bar|
# 	bar.length > 6
# end
# p bars

#2 - SHOULD RETURN SAME AS ABOVE
# neighborhoods.keep_if do |neighborhood|
# 	!neighborhood.include? " "
# end
# p neighborhoods

# bars.keep_if do |neighborhood, bar|
# 	bar.length <= 6
# end
# p bars

#3
new_neighborhoods = neighborhoods.drop_while do |neighborhood|
	neighborhood.include? " "
end
p new_neighborhoods

bars.keep_if do |neighborhood, bar|
	bar.length <= 6
	if bar.length <= 6
		break
	end
end
p bars
