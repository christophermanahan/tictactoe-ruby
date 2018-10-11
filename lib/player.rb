class Player
	def initialize(number, move_maker, board)
		@number = number
		@move_maker = move_maker
		@board = board
	end

	def make_move()
		move = move_maker.retrieve_value.to_i
		board.set_player(number, move)
	end

	private
	attr_reader :number, :move_maker, :board
end
