require "./lib/players"

class MockPlayer
	def make_move()
	end
end

describe "players" do
	let (:test_number) { test_number = 0 }
	let (:mock_players) { mock_players = Array.new(2).fill(MockPlayer.new) }
	let (:players) { players = Players.new(mock_players, test_number) }

	it "Is initialized with all set to an array of player instances" do
		expect(players.all).to all(be_a(MockPlayer))
	end

	it "Is initialized with current_player" do
		expect(players.current_player).to eq test_number
	end

	it "Has a method make_move that calls the current player's make_move method" do
		target_player = players.all[players.current_player]
		expect(target_player).to receive(:make_move)
		players.make_move
	end
end
