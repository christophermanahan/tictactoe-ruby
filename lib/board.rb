class Board
  def initialize(cells)
    @cells = cells
  end

  def get_board()
    cells.map(&:symbol)
  end

  def full?()
    cells.all? { |cell| !cell.empty? }
  end

  def convert_position(position)
    position.to_i - 1
  end

  def set_symbol(symbol, position)
    converted_position = convert_position(position)
    target_cell = cells[converted_position]
    target_cell.fill(symbol)
  end

  private
  attr_reader :cells
end
