class Santa

	def initialize(gender, ethnicity)
		@gender = gender
		@ethnicity = ethnicity
		change_age
		change_reindeer_ranking
		puts "Initializing Santa instance with gender: #{@gender} and ethnicity: #{ethnicity}"	

	end
	
	def change_reindeer_ranking(reindeer_ranking = [ "Rudolph", 
												  "Dasher", 
												  "Dancer", 
												  "Prancer", 
												  "Vixen", 
												  "Comet", 
												  "Cupid", 
												  "Donner", 
												  "Blitzen" ] )
		@reindeer_ranking = reindeer_ranking
	end

	def change_age(age = 0)
		@age = age
	end

	#Takes no parameters
	#Returns nil
	def speak
		puts "Ho, ho, ho! Haaaaaaappy holidays!"
	end


	#Takes a string
	#Returns nil
	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}"
	end

end

santas = []
santa_attributes = [["agender", "black"],
					["female", "Latino"],
					["bigender", "white"],
					["male", "Japanese"],
					["female", "prefer not to say"],
					["gender fluid", "Mystical Creature (unicorn)"],
					["N/A", "N/A"], 
					["female", ""],
					["third gender", "Latinx"] ]

santa_attributes.each { |attributes| santas << Santa.new(attributes[0], attributes[1]) }


