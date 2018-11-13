class Player
  attr_reader :symbol

  def initialize(move:, symbol:)
    @move = move
    @symbol = symbol
  end

  def play(game)
    game.move(symbol: symbol, to: move.get)
  end

  private

  attr_reader :move
end
