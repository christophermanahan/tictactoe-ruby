class Board
	def initialize(size, cell)
		@cells = Array.new(size*size) { cell.new }
	end

	def get_board()
		cells.map { |cell| cell.move }
	end

	def full?()
		cells.all? { |cell| not cell.empty? }
	end

	def set_move(move, position)
		target_cell = cells[position]
		target_cell.set_move(move)
	end

	private
	attr_reader :cells
end
