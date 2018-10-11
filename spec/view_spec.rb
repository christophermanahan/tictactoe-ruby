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
	let (:view) { view = View.new(MockPlayerViews.new, MockWriter.new) }
	let (:player_numbers) { player_numbers = [0, nil, nil, nil, nil, nil, nil, nil, nil] }

	it "Has a method display_board that calls writer's write method with a formatted board string" do
		expect(view.display_board(player_numbers)).to eq "test"
	end

	it "Has a method format_board that takes an array of player_numbers and returns a formatted board string" do
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
