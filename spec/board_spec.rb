require "./lib/board"
require "./lib/cell"

describe "board" do
	let (:cells) do 
		Array.new(9) do
			Cell.new
		end
	end

	let (:board) do
		Board.new(cells)
	end

	it "Has a method get_board that returns a representation of the board with the player_number of each position if occupied" do
		board.set_symbol("X", 0)
		expect(board.get_board).to eq ["X", nil, nil, nil, nil, nil, nil, nil, nil]
	end

	it "Has a method full that returns false if set_symbol has not been called on all cells" do
		board.set_symbol("X", 0)
		board.set_symbol("O", 1)
		expect(board.full?).to eq(false)
	end

	it "Has a method full that returns true if set_symbol has been called on all cells" do
		for position in 0..8 do
			board.set_symbol("X", position)
		end
		expect(board.full?).to eq(true)
	end
end
