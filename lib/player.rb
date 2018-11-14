class Player
  attr_reader :symbol

  def initialize(make:, symbol:)
    @make = make
    @symbol = symbol
  end

  def play(game)
    game.move(symbol: symbol, to: make.move(game))
  end

  private

  attr_reader :make
end
