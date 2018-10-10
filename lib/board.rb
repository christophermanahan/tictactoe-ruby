class Board
	attr_reader :cells

	def initialize(size, cell)
		@cells = Array.new(size*size).fill(cell.new)
	end

	def set_player(player_number, cell)
		target_cell = @cells[cell]
		target_cell.set_player(player_number)
	end
end
