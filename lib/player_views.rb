class PlayerViews
	attr_reader :all

	def initialize(player_views)
		@all = player_views
	end

	def get_player_view(player_number)
		all[player_number]
	end
end
