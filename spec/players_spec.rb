require "./lib/players"

class MockPlayer1
	def make_move()
		"player1"
	end
end

class MockPlayer2
	def make_move()
	end
end

describe "players" do
	let (:test_number) { test_number = 0 }
	let (:mock_players) { mock_players = [MockPlayer1.new, MockPlayer2.new] }
	let (:players) { players = Players.new(mock_players, test_number) }

	it "Has a method make_move that calls the current player's make_move method" do
		target_player = players.all[players.current_player]
		expect(target_player.make_move).to eq "player1"
	end

	it "Has a method make_move that updates the current player" do
		players.make_move
		expect(players.current_player).to eq 1
		players.make_move
		expect(players.current_player).to eq 0
	end
end
