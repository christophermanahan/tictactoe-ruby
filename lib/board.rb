class Board
  def initialize(cells)
    @cells = cells
  end

  def combinations
    [rows.flatten, columns.flatten, diagonals.flatten]
  end

  def put(symbol, position)
    converted_position = convert_position(position)
    target_cell = cells[converted_position]
    target_cell.fill(symbol)
  end

  private

  attr_reader :cells

  def symbols
    cells.map(&:symbol)
  end

  def size
    Math.sqrt(cells.size).to_i
  end

  def convert_position(position)
    position.to_i - 1
  end

  def rows
    symbols.each_slice(size)
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
