class Human
  attr_reader :symbol

  def initialize(input:, symbol:)
    @input = input
    @symbol = symbol
  end

  def play(game)
    game.move(symbol: symbol, to: input.get)
  end

  private

  attr_reader :input
end
