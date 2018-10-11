require "./lib/player"

class MockMoveMaker
	def retrieve_value()
		"1"
	end
end

class MockBoard
	def set_player(player_number, cell)
		[player_number, cell]
	end
end

describe "player" do
	let (:test_player_number) { test_player_number = 0 }
	let (:player) { player = Player.new(test_player_number, MockMoveMaker.new, MockBoard.new) }

	it "Is initialized with a number" do
		expect(player.number).to eq test_player_number
	end

	it "Is initialized with a move_maker" do
		expect(player.move_maker).to be_a(MockMoveMaker)
	end

	it "Is initialized with a board" do
		expect(player.board).to be_a(MockBoard)
	end

	it "Has a method make_move that calls the board's set_player method with the player_number and the result of retrieve_value converted to int" do
		expect(player.make_move).to eq [test_player_number, 1]
	end
end
