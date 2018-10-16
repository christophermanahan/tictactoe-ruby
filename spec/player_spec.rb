require "./lib/player"

class MockMoveMaker
	def retrieve_value()
		"1"
	end
end

class MockBoard
	def set_move(move, positions)
		[move, positions]
	end
end

describe "player" do
	let (:test_player_symbol) { test_player_symbol = "X" }
	let (:player) { player = Player.new(test_player_symbol, MockMoveMaker.new, MockBoard.new) }

	it "Has a method make_move that calls the board's set_player method with the player_number and the result of retrieve_value converted to int" do
		expect(player.make_move).to eq [test_player_symbol, 0]
	end
end
