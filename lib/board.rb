class Board
	attr_reader :cells

	def initialize(size, cell)
		@cells = Array.new(size*size).fill(cell.new)
	end

	def set_player(player_number, coordinate)
		target_cell = @cells[coordinate.position]
		target_cell.set_player(player_number)
	end
end
