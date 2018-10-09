class Cell
	attr_reader :player

	def set_player(player)
		@player = player
	end

	def empty?()
		player == nil
	end
end
