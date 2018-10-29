class Game
  def initialize(board:, symbols:, presenter:, input:, messages:)
    @board = board
    @symbols = symbols
    @presenter = presenter
    @input = input
    @messages = messages
  end

  def run
    win? ? won : continue
  end

  private

  attr_reader :board, :symbols, :presenter, :messages, :input

  def win?
    board.combinations.any? do |in_a_row|
      unique = in_a_row.uniq
      !unique.first.nil? && unique.size == 1
    end
  end

  def won
    message = messages.winning(player: symbols.peek)
    presenter.present(message)
  end

  def continue
    symbols.next
    message = messages.current(player: symbols.peek)
    presenter.present(message)
    board.put(symbol: symbols.peek, at: input.get)
    run
  end
end
