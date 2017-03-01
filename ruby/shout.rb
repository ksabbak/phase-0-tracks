module Shout
	#Code coming soon
	def self.yell_angrily(words)
		words.upcase + "!!!" + " :("
	end

	def self.yell_happily(words)
		"OMG " + words.upcase + "!!! YAY!!!"
	end

end

p Shout.yell_happily("Chaise lounge")
p Shout.yell_angrily("I forgot to ask my roommate about the lights")