class Game
  def initialize(board, board_formatter, symbols, displayer, input)
    @board = board
    @board_formatter = board_formatter
    @symbols = symbols
    @displayer = displayer
    @input = input
  end

  def run()
    display_board
    if !board.full?
      move(symbols.first)
      @symbols = symbols.reverse
      run
    end
  end

  private
  attr_reader :board, :board_formatter, :symbols, :displayer, :input
  def display_board()
    rows = board.rows
    formatted_board = board_formatter.format_board(rows)
    displayer.display(formatted_board)
  end

  def move(symbol)
    displayer.display("Choose a Move! (1-9)")
    position = input.get
    board.place_move_on_board(symbol, position)
  end
end
