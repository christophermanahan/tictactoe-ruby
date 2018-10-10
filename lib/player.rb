class Player
	attr_reader :number, :move_maker, :board

	def initialize(number, move_maker, board)
		@number = number
		@move_maker = move_maker
		@board = board
	end

	def make_move()
		move_maker.get_move()
	end
end
