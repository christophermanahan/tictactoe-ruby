class Game
  def initialize(board:, players:, presenter:)
    @board = board
    @players = players
    @presenter = presenter
  end

  def run
    win? ? won : continue
  end

  private

  attr_reader :board, :players, :messages, :presenter

  def win?
    board.combinations.any? do |in_a_row|
      unique = in_a_row.uniq
      !unique.first.nil? && unique.size == 1
    end
  end

  def won
    presenter.present(board: board, message: players.peek.win_message)
  end

  def continue
    players.next
    presenter.present(board: board, message: players.peek.move_message)
    board.put(symbol: players.peek.symbol, at: players.peek.make_move)
    run
  end
end
