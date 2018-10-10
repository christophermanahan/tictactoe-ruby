class Board
	attr_reader :cells

	def initialize(size, cell)
		@cells = Array.new(size*size) { cell.new }
	end

	def full?()
		cells.all? { |cell| not cell.empty? }
	end

	def set_player(player_number, cell)
		target_cell = cells[cell]
		target_cell.set_player(player_number)
	end
end
