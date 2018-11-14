require './lib/cell'
require './lib/displayer'
require './lib/board'
require './lib/input'
require './lib/player'
require './lib/colorizer'
require './lib/formatter'
require './lib/presenter'
require './lib/messages'
require './lib/game'
require './lib/loop'

class Main
  def start(io:, clear_console:, default_board_size:, default_symbols:)
    cells = Array.new(default_board_size**2) { Cell.new }

    game = Game.new(Board.new(cells, default_board_size))

    formatter = Formatter.new(
      colorizer: Colorizer.new,
      symbols: default_symbols
    )

    presenter = Presenter.new(
      displayer: Displayer.new(io),
      clear: clear_console,
      formatter: formatter,
      messages: Messages.new
    )

    input = Input.new(io)

    players = [
      player(input, default_symbols.first),
      player(input, default_symbols.last)
    ].cycle

    Loop.new(
      game: game,
      players: players,
      presenter: presenter
    ).run
  end

  private

  def player(make, symbol)
    Player.new(
      make: make,
      symbol: symbol
    )
  end
end
