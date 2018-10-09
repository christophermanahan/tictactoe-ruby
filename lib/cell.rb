class Cell
	attr_reader :player

	def setPlayer(player_number)
		@player = player_number
	end

	def empty?()
		player == nil
	end
end
