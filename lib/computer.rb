class Computer
  attr_reader :symbol

  def initialize(symbol:, opponent:, pauser:)
    @symbol = symbol
    @opponent = opponent
    @pauser = pauser
  end

  def play(game)
    pauser.pause
    move = game.available_moves.find do |opponent_move|
      game.move(symbol: opponent, to: opponent_move).win?
    end
    game.move(symbol: symbol, to: move || game.available_moves.first)
  end

  private

  attr_reader :opponent, :pauser
end
