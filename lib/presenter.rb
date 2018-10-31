class Presenter
  def initialize(displayer:, clear:)
    @displayer = displayer
    @clear = clear
  end

  def present(board:, message:)
    board = format(flatten(board))
    [clear, board, message].each do |render|
      displayer.display(render)
    end
  end

  private

  attr_reader :displayer, :clear, :size

  def flatten(board)
    (1..board.size**2).to_a.map do |position|
      board.get(at: position)
    end
  end

  def format(board)
    size = Math.sqrt(board.size)
    rows = fill(board).each_slice(size).to_a
    format_builder(rows, size).join("\n")
  end

  def fill(board)
    (1..board.size).to_a.map do |position|
      symbol = board[position - 1]
      symbol.nil? ? position : symbol
    end
  end

  def format_builder(rows, size)
    rows.inject([divider(size)]) do |acc, row|
      acc << row_string(row)
      acc << divider(size)
      acc
    end
  end

  def divider(size)
    "+#{Array.new(size).fill('-----').join('+')}+"
  end

  def row_string(row)
    "|  #{row.join('  |  ')}  |"
  end
end
