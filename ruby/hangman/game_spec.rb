require_relative 'game'

describe Game do 
	let(:game) {Game.new("Hello World!")}

	it "Creates the board on initialization" do
		expect(game.gameboard).to eq "_ _ _ _ _  _ _ _ _ _!"
	end
	
	it "Checks user input guess against the word they're guessing" do
		expeect(game.process_guess("e")).to be true
	end

	it "Updates the gameboard with the guess" do
		game.update_gameboard("e")
		expect(game.gameboard).to eq "_ e _ _ _  _ _ _ _ _!"
	end

	it "Returns good or bad message depending on win/loss" do
		expect(game.final_message).to eq "Bad message" #THIS WILL CHANGE WHEN THE CODE IS UPDATED
	end
end