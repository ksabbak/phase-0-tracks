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

	attr_reader :gameboard, :wrong_guess

	def initialize(word)
		p "just run please."
	end

	def process_guess(letter)
	end

	def update_gameboard(letter)
	end

	def final_message
	end
end

game = Game.new("Hello world!")