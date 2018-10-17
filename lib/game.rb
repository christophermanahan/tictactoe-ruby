class Game
  def initialize(board, board_formatter, displayer, input, symbols)
    @board = board
    @board_formatter = board_formatter
    @displayer = displayer
    @input = input
    @symbols = symbols
  end

  def run()
    rows = board.rows
    formatted_board = board_formatter.format_board(rows)
    displayer.display(formatted_board)
    if !board.full?
      board.put(symbols.next, input.get)
      run
    end
  end

  private
  attr_reader :board, :board_formatter, :displayer, :input, :symbols
end
