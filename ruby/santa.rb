class Santa

	attr_reader :ethnicity, :age 
	attr_accessor :reindeer_ranking, :gender

	def initialize(gender, ethnicity)
		@gender = gender
		@ethnicity = ethnicity
		@age = 0
		@reindeer_ranking = [ "Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen" ]
		puts "Initializing Santa instance with gender: #{@gender} and ethnicity: #{ethnicity}"	

	end

	def celebrate_birthday
		@age += 1
	end

	def get_mad_at(reindeer)
		@reindeer_ranking.delete_at(@reindeer_ranking.index(reindeer))
		@reindeer_ranking << reindeer
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


	##SETTER METHODS
	def gender=(new_gender)
		@gender = new_gender
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

p "This is Santa 7: #{santas[6].gender} #{santas[6].ethnicity} #{santas[6].age} #{santas[6].reindeer_ranking}"

p "Santa 3 identifies as #{santas[2].gender}"
santas[2].gender = "nonbinary"
p "Santa 3 now identifies as #{santas[2].gender}"

santas[0].get_mad_at("Rudolph")
p santas[0].reindeer_ranking

p santas[4].celebrate_birthday
p santas[4].age
