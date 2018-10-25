require './lib/cell'
require './lib/formatter'
require './lib/displayer'
require './lib/input'
require './lib/user_interface'
require './lib/board'
require './lib/game'

class Main
  def start(io)
    cells = Array.new(9) { Cell.new }
    symbols = %w[X O].cycle
    user_interface = UserInterface.new(
      formatter: Formatter.new,
      displayer: Displayer.new(io),
      input: Input.new(io)
    )

    game = Game.new(
      board: Board.new(cells),
      symbols: symbols,
      user_interface: user_interface
    )

    game.run
  end
end
