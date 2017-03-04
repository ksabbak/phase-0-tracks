require_relative 'game'

describe Game do 
	let(:game) {Game.new("Hello World!")}

#INITIALIZING
	it "Creates the board on initialization" do
		expect(game.gameboard).to eq "_ _ _ _ _   _ _ _ _ _!"
	end

	it "Handles an underscore character when initialized" do
		game_underscore = Game.new("I_hate my opponent")
		expect(game_underscore.gameboard).to eq "_   _ _ _ _   _ _   _ _ _ _ _ _ _ _"
	end

	it "Updates the remaining guesses when initialized" do
		expect(game.guesses_remaining).to eq 20
	end
	
#USER TURNS
	it "Checks user input guess against the word they're guessing (in word)" do
		expect(game.process_guess("e")).to be true
	end

	it "Checks user input guess against the word they're guessing (not in word)" do
		expect(game.process_guess("z")).to be false
	end

	it "Decrements the number of guesses left" do
		game.process_guess("e")
		expect(game.guesses_remaining).to eq 19
	end

	it "Doesn't decrement the number of guesses left if already guessed" do
		game.process_guess("e")
		game.process_guess("e")
		expect(game.guesses_remaining).to eq 19
	end

	it "Updates the gameboard with the guess" do
		game.process_guess("e")
		expect(game.gameboard).to eq "_ e _ _ _   _ _ _ _ _!"
	end

	it "Updates the gameboard with the guesses" do
		game.process_guess("e")
		game.process_guess("l")
		expect(game.gameboard).to eq "_ e l l _   _ _ _ l _!"
	end

	it "Does not update the gameboard with a wrong guess" do
		game.process_guess("z")
		expect(game.gameboard).to eq "_ _ _ _ _   _ _ _ _ _!"
	end

#END GAME
	it "Tests to see if the user wins or is out of turns (game ongoing)" do
		expect(game.is_over?).to be false
	end
	
	it "Tests to see if the user wins or is out of turns (0 turns)" do
		new_game = Game.new("e")
		new_game.process_guess("z")
		new_game.process_guess("x")
		new_game.process_guess("y")
		expect(new_game.is_over?).to be true
	end

	it "Returns good or bad message depending on win/loss" do
		expect(game.final_message).to eq "Bad message" #THIS WILL CHANGE WHEN THE CODE IS UPDATED
	end
end