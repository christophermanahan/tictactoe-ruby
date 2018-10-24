class Game
  def initialize(board:, user_interface:, symbols:)
    @board = board
    @user_interface = user_interface
    @symbols = symbols
  end

  def run
    user_interface.display_board(board.rows)
    return if board.full?

    board.put(symbols.next, user_interface.get)
    run
  end

  private

  attr_reader :board, :user_interface, :symbols
end
