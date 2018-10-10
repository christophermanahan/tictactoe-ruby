require "./lib/player_view"

describe "player_view" do
	it "Is initialized with a symbol" do
		player_view = PlayerView.new("X")
		expect(player_view.symbol).to eq "X"
	end
end
