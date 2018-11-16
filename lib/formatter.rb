class Formatter
  def initialize(colorizer:, symbols:)
    @colorizer = colorizer
    @symbols = symbols
  end

  def format(board)
    flattened = flatten(board)
    symbols_or_positions = nil_to_position(flattened)
    colored = color(symbols_or_positions)
    rows = colored.each_slice(board.size).to_a
    rows_and_dividers(rows).join("\n")
  end

  private

  attr_reader :colorizer, :symbols

  def flatten(board)
    (1..board.size**2).to_a.map do |position|
      board.get(at: position)
    end
  end

  def nil_to_position(flattened)
    flattened.map.with_index do |symbol, position|
      symbol.nil? ? convert(position) : symbol
    end
  end

  def color(symbols_or_positions)
    symbols_or_positions.map do |symbol_or_position|
      case symbol_or_position
      when symbols.first
        colorizer.symbol_1(symbol_or_position)
      when symbols.last
        colorizer.symbol_2(symbol_or_position)
      else
        colorizer.position(symbol_or_position)
      end
    end
  end

  def rows_and_dividers(rows)
    rows.inject([divider(rows.size)]) do |acc, row|
      acc << bordered_row(row)
      acc << divider(rows.size)
      acc
    end
  end

  def divider(size)
    "+#{Array.new(size).fill('-----').join('+')}+"
  end

  def bordered_row(row)
    "|  #{row.join('  |  ')}  |"
  end

  def convert(position)
    (position + 1).to_s
  end
end
