class Game
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def over?
    win? || tie?
  end

  def win?
    board.combinations.any? do |in_a_row|
      unique = in_a_row.uniq
      !unique.first.nil? && unique.size == 1
    end
  end

  def tie?
    !win? && board.full?
  end

  def move(symbol:, to:)
    board.put(symbol: symbol, at: to)
  end

  def available_moves
    board.available_positions
  end
end
