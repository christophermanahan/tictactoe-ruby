require "./lib/board"
require "./lib/cell"

describe "board" do
	let (:board) { board = Board.new(3, Cell) }

	it "Has a method number_array that returns a representation of the board with the player_number of each position if occupied" do
		board.set_player(0, 0)
		expect(board.number_array).to eq [0, nil, nil, nil, nil, nil, nil, nil, nil]
	end

	it "Has a method full that returns false if set_player has not been called on all cells" do
		board.set_player(0, 0)
		board.set_player(0, 1)
		expect(board.full?).to eq(false)
	end

	it "Has a method full that returns true if set_player has been called on all cells" do
		for cell in 0..8 do
			board.set_player(0, cell)
		end
		expect(board.full?).to eq(true)
	end
end
