class Cell
	attr_reader :player

	def set_player(player_number)
		@player = player_number
	end

	def empty?()
		player == nil
	end
end
