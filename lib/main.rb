require './lib/cell'
require './lib/displayer'
require './lib/messages'
require './lib/board'
require './lib/input'
require './lib/presenter'
require './lib/game'

class Main
  def start(io, clear_console, default_board_size)
    cells = Array.new(default_board_size**2) { Cell.new }
    symbols = %w[O X].cycle
    presenter = Presenter.new(
      displayer: Displayer.new(io),
      clear: clear_console
    )
    Game.new(
      presenter: presenter,
      input: Input.new(io),
      board: Board.new(cells, default_board_size),
      symbols: symbols,
      messages: Messages.new
    ).run
  end
end
