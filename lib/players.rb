class Players
	attr_reader :all, :current_player

	def initialize(players, current_player)
		@all = players
		@current_player = current_player
	end

	def make_move()
		target_player = all[current_player]
		target_player.make_move()
	end
end
