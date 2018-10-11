class Board
	def initialize(size, cell)
		@cells = Array.new(size*size) { cell.new }
	end

	def number_array()
		cells.map { |cell| cell.player }
	end

	def full?()
		cells.all? { |cell| not cell.empty? }
	end

	def set_player(player_number, idx)
		target_cell = cells[idx]
		target_cell.set_player(player_number)
	end

	private
	attr_reader :cells
end
