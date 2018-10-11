class Players
	attr_reader :current_player

	def initialize(num_players, player, move_maker, board, starting_player)
		@all = Array.new(num_players).each_with_index.map { |_, i| player.new(i, move_maker, board) }
		@current_player = starting_player
	end

	def make_move()
		current = current_player
		target_player = all[current_player]
		target_player.make_move()
		update_current_player
		current
	end

	private
	attr_reader :all

	def update_current_player()
		@current_player = (current_player+1).modulo(all.size)
	end
end
