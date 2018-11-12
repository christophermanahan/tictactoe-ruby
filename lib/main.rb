require './lib/cell'
require './lib/displayer'
require './lib/board'
require './lib/input'
require './lib/player'
require './lib/colorizer'
require './lib/formatter'
require './lib/presenter'
require './lib/game'

class Main
  def start(
    io:,
    clear_console:,
    default_board_size:,
    default_symbols:,
    default_move_message_prefix:,
    default_win_message_suffix:
  )

    cells = Array.new(default_board_size**2) { Cell.new }

    formatter = Formatter.new(
      colorizer: Colorizer.new,
      symbols: default_symbols
    )

    presenter = Presenter.new(
      displayer: Displayer.new(io),
      clear: clear_console,
      formatter: formatter
    )

    input = Input.new(io)

    players = [
      Player.new(
        move_maker: input,
        symbol: default_symbols.first,
        move_message: default_move_message_prefix + default_symbols.first,
        win_message: default_symbols.first + default_win_message_suffix
      ),
      Player.new(
        move_maker: input,
        symbol: default_symbols.last,
        move_message: default_move_message_prefix + default_symbols.last,
        win_message: default_symbols.last + default_win_message_suffix
      )
    ].cycle

    Game.new(
      board: Board.new(cells, default_board_size),
      players: players,
      presenter: presenter
    ).run
  end
end
