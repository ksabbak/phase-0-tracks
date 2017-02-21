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