# module Shout
# 	#Code coming soon
# 	def self.yell_angrily(words)
# 		words.upcase + "!!!" + " :("
# 	end

# 	def self.yell_happily(words)
# 		"OMG " + words.upcase + "!!! YAY!!!"
# 	end

# end

# p Shout.yell_happily("Chaise lounge")
# p Shout.yell_angrily("I forgot to ask my roommate about the lights")

module Shout
	#Code coming soon
	def yell_angrily(words)
		words.upcase + "!!!" + " :("
	end

	def yell_happily(words)
		"OMG " + words.upcase + "!!! YAY!!!"
	end

end

class IsleyBrothers
	include Shout

end

class TearsForFears
	include Shout

end

isley_brothers = IsleyBrothers.new
puts isley_brothers.yell_happily("You know you make me want to shout")
puts isley_brothers.yell_angrily("Kick my heals up and shout")

tears_for_fears = TearsForFears.new
puts tears_for_fears.yell_happily("Shout shout let it all out")
puts tears_for_fears.yell_angrily("These are the things I can do without")



