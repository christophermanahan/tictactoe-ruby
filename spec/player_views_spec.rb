require "./lib/player_views"

class MockPlayerView
end

describe "player_views" do
	let (:mock_player_views) { mock_player_views = Array.new(2) { MockPlayerView.new } }
	let (:player_views) { player_views = PlayerViews.new(mock_player_views) }

	it "Has a get_player_view method that takes a player_number and returns the player_view at that index" do
		expect(player_views.get_player_view(0)).to be_a(MockPlayerView)
	end
end
