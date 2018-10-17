class Board
  def initialize(cells)
    @cells = cells
  end

  def rows()
    symbols = cells.map(&:symbol)
    row_length = Math.sqrt(cells.size)
    symbols.each_slice(row_length).to_a
  end

  def full?()
    cells.all? { |cell| !cell.empty? }
  end

  def convert_position(position)
    position.to_i - 1
  end

  def place_move_on_board(symbol, position)
    converted_position = convert_position(position)
    target_cell = cells[converted_position]
    target_cell.fill(symbol)
  end

  private
  attr_reader :cells
end
