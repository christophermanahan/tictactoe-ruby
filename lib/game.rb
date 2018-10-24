class Game
  def initialize(board:, symbols:, user_interface:)
    @board = board
    @symbols = symbols
    @user_interface = user_interface
  end

  def run
    user_interface.display_board(board.rows)
    return if board.full?

    board.put(symbols.next, user_interface.get_input)
    run
  end

  private

  attr_reader :board, :symbols, :user_interface
end
