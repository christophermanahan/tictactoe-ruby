class Player
	def initialize(symbol, move_maker, board)
		@symbol = symbol
		@move_maker = move_maker
		@board = board
	end

	def make_move()
		move = move_maker.retrieve_value.to_i - 1 # This is silly but hmmm
		board.set_move(symbol, move)
	end

	private
	attr_reader :symbol, :move_maker, :board
end
