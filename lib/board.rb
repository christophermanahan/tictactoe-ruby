class Board
  attr_reader :size

  def initialize(cells)
    @cells = cells
    @size = cells.size
    @square = Math.sqrt(size)
  end

  def combinations
    rows + columns + diagonals
  end

  def get(position:)
    converted_position = convert_position(position)
    target_cell = cells[converted_position]
    target_cell.symbol
  end

  def put(symbol:, at:)
    converted_position = convert_position(at)
    target_cell = cells[converted_position]
    target_cell.fill(symbol)
  end

  private

  attr_reader :cells, :square

  def symbols
    cells.map(&:symbol)
  end

  def convert_position(position)
    position.to_i - 1
  end

  def rows
    symbols.each_slice(square).to_a
  end

  def columns
    rows.map.with_index do |_, i|
      rows.map do |row|
        row[i]
      end
    end
  end

  def diagonals
    [0, square - 1].map do |start|
      rows.map.with_index do |_, i|
        rows[i][(start - i).abs]
      end
    end
  end
end
