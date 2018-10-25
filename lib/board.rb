class Board
  def initialize(cells)
    @cells = cells
    @size = Math.sqrt(cells.size)
  end

  def rows
    symbols.each_slice(size).to_a
  end

  def columns
    (0..size - 1).inject([]) do |acc, mod|
      acc << symbols.select.with_index do |_, i|
        i % size == mod
      end
    end
  end

  def diagonals
    diags = []
    diags << symbols.select.with_index { |_, i| (i % (size + 1)).zero? }
    right = symbols.select.with_index { |_, i| (i % (size - 1)).zero? }
    diags << right[1..-2]
  end

  def full?
    cells.all? { |cell| !cell.empty? }
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
end
