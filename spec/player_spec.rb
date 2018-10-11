require "./lib/player"
require "mocks/mock_move_maker"
require "mocks/mock_board"

describe "player" do
	let (:test_player_number) { test_player_number = 0 }
	let (:player) { player = Player.new(test_player_number, MockMoveMaker.new, MockBoard.new) }

	it "Has a method make_move that calls the board's set_player method with the player_number and the result of retrieve_value converted to int" do
		expect(player.make_move).to eq [test_player_number, 1]
	end
end
