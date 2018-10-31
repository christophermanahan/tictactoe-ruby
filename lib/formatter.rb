class Formatter
  def initialize(colorizer)
    @colorizer = colorizer
  end

  def format(board)
    flattened = flatten(board)
    replaced = color_and_replace_nil(flattened)
    rows = replaced.each_slice(board.size).to_a
    rows_and_dividers(rows).join("\n")
  end

  private

  attr_reader :colorizer

  def flatten(board)
    (1..board.size**2).to_a.map do |position|
      board.get(at: position)
    end
  end

  def color_and_replace_nil(flattened)
    flattened.map.with_index do |symbol, position|
      case symbol
      when nil
        colorizer.magenta(convert(position))
      when 'X'
        colorizer.cyan(symbol)
      when 'O'
        colorizer.yellow(symbol)
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
