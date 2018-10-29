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
    winning = messages.winning(player: symbols.peek)
    presenter.present(board: flat, message: winning)
  end

  def continue
    symbols.next
    current_player = messages.current(player: symbols.peek)
    presenter.present(board: flat, message: current_player)
    board.put(symbol: symbols.peek, at: input.get)
    run
  end

  def flat
    (1..board.size).to_a.map do |position|
      board.get(position: position)
    end
  end
end
