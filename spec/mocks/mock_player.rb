class MockPlayer
	attr_reader :player_number

	def initialize(player_number, move_maker, board)
		@player_number = player_number
	end

	def make_move()
		player_number
	end
end