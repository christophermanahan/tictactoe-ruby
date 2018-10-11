require "./lib/player_views"
require "mocks/mock_player_view"

describe "player_views" do
	let (:player_views) { player_views = PlayerViews.new(MockPlayerView, ["X", "O"]) }

	it "Has a get_player_view method that takes a player_number and returns the player_view at that index" do
		expect(player_views.get_player_view(0).symbol).to eq "X"
	end
end
