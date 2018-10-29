class Board
  def initialize(cells)
    @cells = cells
    @size = Math.sqrt(cells.size).to_i
  end

  def combinations
    rows + columns + diagonals
  end

  def get(position)
    converted_position = convert_position(position)
    target_cell = cells[converted_position]
    target_cell.symbol
  end

  def put(symbol, position)
    converted_position = convert_position(position)
    target_cell = cells[converted_position]
    target_cell.fill(symbol)
  end

  private

  attr_reader :cells, :size

  def symbols
    cells.map(&:symbol)
  end

  def convert_position(position)
    position.to_i - 1
  end

  def rows
    symbols.each_slice(size).to_a
  end

  def columns
    rows.map.with_index do |_, i|
      rows.map do |row|
        row[i]
      end
    end
  end

  def diagonals
    [0, size - 1].map do |start|
      rows.map.with_index do |_, i|
        rows[i][(start - i).abs]
      end
    end
  end
end
