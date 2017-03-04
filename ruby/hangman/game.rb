# THIS IS BASICALLY HANGMAN.

# CLASS PSEUDOCODE:

# Class vars: gameboard, original word, wrong guesses

# CREATE THE GAMEBOARD
# 1. takes: The user input (string)
# 2. gets the length of that input
# 2.5 gets the length of the input without spaces
# 3. Returns a string the same length of the user input with
# 	non letter characters still there, everything else
# 	replaced with _ - this is the GAMEBOARD

# PROCESS THE GUESS
# 1. Takes in the letter
# 2. If longer than 1 char, returns error
# 3. If exists in original word, update GAMEBOARD
# 	RETURN TRUE
# 4. if not, increment wrong guesses by one
# 	RETURN FALSE


# UPDATE GAMEBOARD
# 1. Takes the letter
# 2. Replaces all instances of _ with the letter.
# 3. Updates the GAMEBOARD
# 4. Returns whatever it wants, that doesn't matter.

# FINAL MESSAGE
# 1. takes nothing
# 2. if GAMEBOARD doesn't have _s then print something nice
# 3. If GAMEBOARD does have _s then print something rude

class Game
=begin
	@original_word
	@gameboard
	@guesses_remaining
	@prev_guesses 
=end
	attr_reader :gameboard, :guesses_remaining, :prev_guesses

	def initialize(word)
		@original_word = word.downcase
		@gameboard = ""
		@prev_guesses = []

		letter_replace = "_ "

		words = word.split("")
		words.each do |letter|
			if letter.downcase.match(/^[[:alpha:]]+$/) #Tbh, I'm not sure if this is easier than pasting in the alphabet string
				@gameboard << letter_replace
			elsif " _".include? letter
				@gameboard << " "
			else
				@gameboard.chomp!(" ") << letter 
			end
		end

		establish_guess_limit
		@gameboard.chomp!(" ")	
	end
	
	#Processes a user's guess. Assumes a single alpha char input.
	def process_guess(letter)

		letter = letter.downcase

		if @prev_guesses.include? letter
			puts "This has already been guessed"
			print_status
			return false 
		else
			@prev_guesses << letter
			decrement_guesses
		end

		if @original_word.include? letter
			update_gameboard(letter)
			print_status
			return true
		else
			print_status
			return false
		end
	end

	def update_gameboard(letter)
	end

	def is_over?
	end

	def final_message
	end

	def print_status
		status_string = "full string"
		puts "#{@gameboard}"
		puts "Turns remaining: #{guesses_remaining}"
	end

	private
		def establish_guess_limit
			
			total_guessable = @gameboard.count("_")
			
			if total_guessable < 5
				@guesses_remaining = total_guessable * 3 
			elsif total_guessable < 15
				@guesses_remaining = total_guessable * 2
			else
				@guesses_remaining = (total_guessable * 1.5).to_i
			end
		end
		def decrement_guesses
			@guesses_remaining -= 1
		end
end

#p game = Game.new("Can't stop me")

