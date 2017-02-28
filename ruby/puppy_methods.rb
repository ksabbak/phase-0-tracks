class Puppy

	def initialize(name="Spot")
		puts "Initializing new puppy instance"
		@name = name
	end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(integer)
  	count = 0
	  	until integer == count
		  	puts "woof"
		  	count += 1
  		end
	end

	def roll_over
		puts "*rollsover*"
	end

	def dog_years(years)
		years * 7
	end

	def sit?
		random = Random.new
		#puts random
		obeys = random.rand(2)
		
		if obeys == 1
			puts "The dog sat"
			sit = true
		else
			puts "The dog didnt listen"
			sit = false
		end
	end
	def name
		@name
	end
end

puppy1 = Puppy.new("fluffy")

puts puppy1.name

puppy1.fetch("tennisball")
puppy1.speak(3)
puppy1.roll_over
puts puppy1.dog_years(20)
10.times do 
puppy1.sit?
end
 puts puppy2 = Puppy.new.name


class Kitten

	def initialize
		puts "Kitten instance"
	end

	def purrs(times)
		purr = ""
		times.times do 
			purr += "r"
		end
		puts purr
	end

	def jump
		puts "the cat jumps to the ledge" 
		puts "cat gets stuck"
		puts "Save me owner!!!"

		# he gets stuck
		# puts Mufasa Save me brother
		# backlegs struggle random if succeeds goes up and gets food
		#else falls and gets run over by me

		random = Random.new
		#puts random
		succeeds = random.rand(2)
		
		if succeeds == 1
			puts "The cat crawls up to safety"
			
		else
			puts "The cat is betrayed by owner and falls"
			
		end
	end

end


kittykat = Kitten.new.jump
kat_array = []
count = 0
loop do 
	kat_array << Kitten.new 

	count +=1
	break if count == 50
end
puts kat_array.length


kat_array.each do |khat|
	random = Random.new
	khat.purrs(random.rand(12)+1)
	khat.jump 
end
puts "This is the end"
