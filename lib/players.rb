class Players
	attr_reader :all, :current_player

	def initialize(players_array, current_player)
		@all = players_array
		@current_player = current_player
	end

	def make_move()
		target_player = all[current_player]
		target_player.make_move()
		update_current_player
	end

	private
	def update_current_player()
		@current_player = (current_player+1).modulo(all.size)
	end
end
