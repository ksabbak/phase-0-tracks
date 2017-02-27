# Get person's name
# make person's first name their last name and last name their first name (swap first and last names)
# Take each letter of the person's name 
# 	if letter is a consonant move it one consonant forward (e.g. b->c)
# 	if letter is a vowel move one vowel forward (e.g. a->e)
# 	if it's none of those, just let it be itself.
# Give the person their new alias.





def scramble(persona)

	persona = persona.split(" ").rotate.join(" ")
	
	vowels = "aeiou".reverse!
	consonants = "bcdfghjklmnpqrstvwxyz".reverse!

	new_persona = persona.chars.map do |letter|
		#If a lowercase vowel 
		if vowels.include? letter
			letter = vowels[vowels.index(letter) - 1]
		
		#if an uppercase vowel
		elsif vowels.upcase.include? letter
			letter = vowels[vowels.index(letter.downcase) - 1].upcase
		
		#if a lowercase consonant
		elsif consonants.include? letter
			letter = consonants[consonants.index(letter) - 1]
		
		#if an uppercase consonant
		elsif consonants.upcase.include? letter
			letter = consonants[consonants.index(letter.downcase) - 1].upcase
		
		#non-letter characters - THIS IS NEEDED without this, all else cases == nil
		else
			letter = letter
		end

	end
	
	new_persona.join
end

def print_hash(agents)
	agents.each do |original, new_name|
		original = original.to_s.split("_")
		original.map! { |part| part.capitalize }
		original = original.join(" ")
		puts "#{original}'s new alias is #{new_name}"
	end
	puts "Alias assignment complete. This program will self destruct."
end

#p scramble("Felicia Torres")

agents = {}

puts "Type 'quit' to quit"

quit = false

until quit
	puts "Please enter a name so we may create an alias: "
	input = gets.chomp
	if input.downcase == 'quit'
		quit = true
	else
		alias_name = scramble(input)
		puts "The new alias is #{alias_name}."
		input_key = input.gsub(" ", "_").downcase.intern
		agents[input_key] = alias_name
	end
end

print_hash(agents)
