class Board
  attr_reader :size

  def initialize(cells, size)
    @cells = cells
    @size = size
  end

  def combinations
    rows + columns + diagonals
  end

  def full?
    cells.all?(&:symbol)
  end

  def available_positions
    positions = cells.each_index.select { |i| cells[i].empty? }
    positions.map { |position| position + 1 }
  end

  def get(at:)
    cells[convert(position: at)].symbol
  end

  def put(symbol:, at:)
    position = convert(position: at)
    replace = cells[position].fill(symbol)
    replaced = cells.map.with_index { |cell, i| i == position ? replace : cell }
    Board.new(replaced, size)
  end

  private

  attr_reader :cells

  def symbols
    cells.map(&:symbol)
  end

  def convert(position:)
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
