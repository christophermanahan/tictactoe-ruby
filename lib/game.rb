class Game
  def initialize(board:, symbols:, user_interface:)
    @board = board
    @symbols = symbols
    @user_interface = user_interface
  end

  def win?(combinations)
    combinations.any? do |combination|
      combination.any? do |in_a_row|
        unique = in_a_row.uniq
        !unique.first.nil? && unique.size == 1
      end
    end
  end

  def run
    user_interface.display(board.rows)
    return if win?([board.rows, board.columns, board.diagonals])

    board.put(symbols.next, user_interface.get_input)
    run
  end

  private

  attr_reader :board, :symbols, :user_interface
end
