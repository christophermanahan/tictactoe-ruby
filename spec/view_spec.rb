require "./lib/view"

class MockWriter
	def write(formatted_board_string)
		"test"
	end
end

class MockPlayerView
	attr_reader :symbol

	def initialize()
		@symbol = "X"
	end
end

class MockPlayerViews
	def get_player_view(player_number)
		MockPlayerView.new
	end
end

describe "view" do
	it "Has a method display_board that calls writer's write method with a formatted board string" do
		test_string = "test"
		view = View.new(MockPlayerViews.new, MockWriter.new)
		player_numbers = [0, nil, nil, nil, nil, nil, nil, nil, nil]
		expect(view.display_board(player_numbers)).to eq test_string
	end

	it "Has a method format_board that takes an array of player_numbers and returns a formatted board string" do
		view = View.new(MockPlayerViews.new, MockWriter.new)
		player_numbers = [0, nil, nil, nil, nil, nil, nil, nil, nil]
		expect(view.format_board(player_numbers)).to eq [
			["+-----+-----+-----+"],
			["|  X  |     |     |"],
			["+-----+-----+-----+"],
			["|     |     |     |"],
			["+-----+-----+-----+"],
			["|     |     |     |"],
			["+-----+-----+-----+"]
		].join("\n")
	end
end