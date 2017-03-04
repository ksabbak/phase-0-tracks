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
	@win
=end
	attr_reader :gameboard, :guesses_remaining, :prev_guesses, :win

	def initialize(word)
		@original_word = word.downcase
		@gameboard = ""
		@prev_guesses = []
		@win = false

		letter_replace = "_ "

		words = word.split("")
		words.each do |letter|
			if letter.downcase.match(/^[[:alpha:]]+$/) #Tbh, I'm not sure if this is easier than pasting in the alphabet string
				@gameboard << letter_replace
			elsif " _".include? letter
				@gameboard << "  "
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
			puts "\"#{letter}\" has already been guessed"
			print_status
			return false 
		else
			@prev_guesses << letter
			decrement_guesses
		end

		if @original_word.include? letter
			update_gameboard(letter)
			print_status
			true
		else
			print_status
			false
		end
	end

	def update_gameboard(letter)
		
		special_char_index_modifier = 0

		@gameboard.split("").each_index do |position|
			if !(@gameboard[position].match(/^[[:alpha:]]+$/)) && !(" _".include? @gameboard[position])
				special_char_index_modifier += 1
			end

			if (@gameboard[position] == "_") && (@original_word[(position / 2) + special_char_index_modifier] == letter)
				@gameboard[position] = letter
			end
		end
		@gameboard
	end

	def is_over?
		if !(@gameboard.include? "_")
			@win = true
		elsif guesses_remaining == 0 
			true
		else
			false
		end
	end

	def final_message
		if @win
			"*confetti* we have a winner!"
		else
			"Game over man, game over! Better luck next time."
		end
	end

	def print_status
		puts "#{@gameboard}"
		puts "Turns remaining: #{guesses_remaining}"
	end

	private
		def establish_guess_limit
			
			total_guessable = @gameboard.count("_")

			#So it occurred to me that having more than 26 guesses made this game
			#impossible to lose. But limiting the guesses to 25 could make it 
			#impossible to win. While I have set most of the guess limits to 
			#depend on the length of the original word/phrase, I have also 
			#controlled for those scenarios.

			unique_letters_total = 0
			"abcdefghijklmnopqrstuvwxyz".each_char do |letter|
				if @original_word.include? letter
					unique_letters_total += 1
				end
			end
			
			if total_guessable < 5
				@guesses_remaining = total_guessable * 3 
			elsif total_guessable < 14
				@guesses_remaining = (total_guessable * 1.5).to_i
			elsif unique_letters_total < 20
				@guesses_remaining = 20
			else
				guesses_remaining = unique_letters_total + 1
			end
		end

		def decrement_guesses
			@guesses_remaining -= 1
		end
end

#DRIVER CODE TIME

puts "Welcome to Game, the violence free version of Hangman!"
puts "Please enter a word or phrase for your opponent to guess, don't let them see!"
input = gets.chomp
game = Game.new(input)

print "\n" * 20 # No cheating!
game.print_status
puts "Hello player two! As you can see above, you have a limited number of turns"
puts "to guess your opponent's word or phrase."
until game.is_over?
	puts "Please enter a letter: "
	input = gets.chomp
	if input.downcase.match(/^[[:alpha:]]+$/) && input.length == 1
		game.process_guess(input)
	else
		puts "That's not going to help you."
		game.print_status
	end
end
puts game.final_message



