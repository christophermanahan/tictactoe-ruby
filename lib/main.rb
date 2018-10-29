require './lib/cell'
require './lib/displayer'
require './lib/messages'
require './lib/board'
require './lib/input'
require './lib/presenter'
require './lib/game'

class Main
  def start(io, clear)
    cells = Array.new(9) { Cell.new }
    symbols = %w[O X].cycle
    presenter = Presenter.new(
      displayer: Displayer.new(io),
      clear: clear
    )
    Game.new(
      presenter: presenter,
      input: Input.new(io),
      board: Board.new(cells),
      symbols: symbols,
      messages: Messages.new
    ).run
  end
end
