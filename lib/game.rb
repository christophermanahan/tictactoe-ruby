class Game
  def initialize(board:, symbols:, user_interface:)
    @board = board
    @symbols = symbols
    @user_interface = user_interface
  end

  def run
    user_interface.display(board.rows)
    if win?
      user_interface.winner(symbols.first)
    else
      board.put(symbols.next, user_interface.get_input)
      run
    end
  end

  private

  attr_reader :board, :symbols, :user_interface

  def win?
    board.combinations.any? do |in_a_row|
      unique = in_a_row.uniq
      !unique.first.nil? && unique.size == 1
    end
  end
end
