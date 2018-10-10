require "./lib/player"

class MockMoveMaker
	def get_move()
	end
end

# Not sure I need this or not we shall see
class MockBoard
end

describe "player" do
	let (:test_number) { test_number = 0 }
	let (:player) { player = Player.new(test_number, MockMoveMaker.new, MockBoard.new) }

	it "Is initialized with a number" do
		expect(player.number).to eq test_number
	end

	it "Is initialized with a move_maker" do
		expect(player.move_maker).to be_a(MockMoveMaker)
	end

	it "Is initialized with a board" do
		expect(player.board).to be_a(MockBoard)
	end

	it "Has a method make_move that calls the move_maker's get_move method" do
		expect(player.move_maker).to receive(:get_move)
		player.make_move()
	end

	it "Has a method make_move that calls the board set_move method with the result of move_maker's get_move method" do
	end
end
