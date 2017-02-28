class Santa

	def initialize
		puts "Initializing Santa instance…"	

	end
	

	#Takes no parameters
	#Returns nil
	def speak
		puts "Ho, ho, ho! Haaaaaaapy holidays!"
	end


	#Takes a string
	#Returns nil
	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}"
	end

end

kris_k = Santa.new
kris_k.speak
kris_k.eat_milk_and_cookies("Oreo")