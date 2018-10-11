require "mocks/mock_player_view"

class MockPlayerViews
	def get_player_view(player_number)
		MockPlayerView.new("X")
	end
end
