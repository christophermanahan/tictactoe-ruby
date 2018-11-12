class Game
  def initialize(board:, players:, messages:, presenter:)
    @board = board
    @players = players
    @messages = messages
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
    winning = messages.winning(player: players.peek.symbol)
    presenter.present(board: board, message: winning)
  end

  def continue
    players.next
    current_player = messages.current(player: players.peek.symbol)
    presenter.present(board: board, message: current_player)
    board.put(symbol: players.peek.symbol, at: players.peek.make_move)
    run
  end
end
