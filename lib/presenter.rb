class Presenter
  def initialize(displayer:, clear_message:, board:)
    @displayer = displayer
    @clear_message = clear_message
    @board = board
  end

  def present(message)
    [clear_message, format_board, message].each do |render|
      displayer.display(render)
    end
  end

  private

  attr_reader :displayer, :board, :clear_message

  def format_board
    rows = flat_board.each_slice(board.size).to_a
    format_builder(rows).join("\n")
  end

  def flat_board
    (1..board.size**2).to_a.map do |position|
      symbol = board.get(position)
      symbol.nil? ? position : symbol
    end
  end

  def format_builder(rows)
    rows.inject([divider]) do |acc, row|
      acc << row_string(row)
      acc << divider
      acc
    end
  end

  def divider
    "+#{Array.new(board.size).fill('-----').join('+')}+"
  end

  def row_string(row)
    "|  #{row.join('  |  ')}  |"
  end
end
