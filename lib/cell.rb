class Cell
	attr_reader :move

	def set_move(move)
		@move = move
	end

	def empty?()
		move == nil
	end
end
