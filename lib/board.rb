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

  def set_symbol(symbol, position)
    target_cell = cells[position]
    target_cell.fill(symbol)
  end

  private
  attr_reader :cells
end
