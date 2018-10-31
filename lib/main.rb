require './lib/cell'
require './lib/displayer'
require './lib/messages'
require './lib/board'
require './lib/input'
require './lib/colorizer'
require './lib/formatter'
require './lib/presenter'
require './lib/game'

class Main
  def start(io, clear_console, default_board_size)
    cells = Array.new(default_board_size**2) { Cell.new }
    symbols = %w[O X].cycle
    formatter = Formatter.new(Colorizer.new)
    presenter = Presenter.new(
      displayer: Displayer.new(io),
      clear: clear_console,
      formatter: formatter
    )
    Game.new(
      board: Board.new(cells, default_board_size),
      symbols: symbols,
      messages: Messages.new,
      input: Input.new(io),
      presenter: presenter
    ).run
  end
end
