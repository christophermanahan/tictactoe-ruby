require "./lib/board_formatter"

class MockBoard
	def get_board()
		["X", nil, nil, nil, nil, nil, nil, nil, nil]
	end
end

describe "board_formatter" do
	let (:board_formatter) { board_formatter = BoardFormatter.new(MockBoard.new) }
	let (:formatted_board_string) { [
			["+-----+-----+-----+"],
			["|  X  |  2  |  3  |"],
			["+-----+-----+-----+"],
			["|  4  |  5  |  6  |"],
			["+-----+-----+-----+"],
			["|  7  |  8  |  9  |"],
			["+-----+-----+-----+"]
		].join("\n") }

	it "Has a method format_board that takes an array of player_numbers and returns a formatted board string" do
		expect(board_formatter.format_board).to eq formatted_board_string
	end
end
