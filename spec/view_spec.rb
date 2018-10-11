require "./lib/view"
require "mocks/mock_writer"
require "mocks/mock_player_views"

describe "view" do
	let (:view) { view = View.new(MockPlayerViews.new, MockWriter.new) }
	let (:player_numbers) { player_numbers = [0, nil, nil, nil, nil, nil, nil, nil, nil] }
	let (:formatted_board_string) { [
			["+-----+-----+-----+"],
			["|  X  |     |     |"],
			["+-----+-----+-----+"],
			["|     |     |     |"],
			["+-----+-----+-----+"],
			["|     |     |     |"],
			["+-----+-----+-----+"]
		].join("\n") }

	it "Has a method display_board that calls writer's write method with a formatted board string" do
		expect(view.display_board(player_numbers)).to eq formatted_board_string
	end

	it "Has a method format_board that takes an array of player_numbers and returns a formatted board string" do
		expect(view.format_board(player_numbers)).to eq formatted_board_string
	end
end
