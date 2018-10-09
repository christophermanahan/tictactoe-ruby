class Board
	attr_reader :cells

	def initialize(size, cell)
		@cells = Array.new(size*size).fill(cell.new)
	end

	def setPlayer(player_number, coordinate)
		targetCell = @cells[coordinate.position]
		targetCell.setPlayer(player_number)
	end
end
