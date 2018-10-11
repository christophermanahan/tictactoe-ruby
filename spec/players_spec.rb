require "./lib/players"
require "mocks/mock_player"

describe "players" do
	let (:mock_generic) { mock_generic = {} }
	let (:test_number) { test_number = 0 }
	let (:players) { players = Players.new(2, MockPlayer, mock_generic, mock_generic, test_number) }

	it "Has a method make_move that calls the current player's make_move method" do
		expect(players.make_move).to eq 0
	end

	it "Has a method make_move that updates the current player" do
		players.make_move
		expect(players.current_player).to eq 1
		players.make_move
		expect(players.current_player).to eq 0
	end
end
