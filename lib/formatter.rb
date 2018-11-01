class Formatter
  def initialize(colorizer:, symbols:)
    @colorizer = colorizer
    @symbols = symbols
  end

  def format(board)
    flattened = flatten(board)
    colored = color_and_replace_nil(flattened)
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

  def color_and_replace_nil(flattened)
    flattened.map.with_index do |symbol, position|
      case symbol
      when symbols.first
        colorizer.yellow(symbol)
      when symbols.last
        colorizer.cyan(symbol)
      else
        colorizer.magenta(convert(position))
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
