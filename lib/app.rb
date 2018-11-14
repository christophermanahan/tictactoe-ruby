require './lib/main'

OPEN_READ_WRITE = 1
CLEAR_CONSOLE = "\e[H\e[2J".freeze
DEFAULT_BOARD_SIZE = 3
DEFAULT_SYMBOLS = %w[O X].freeze

Main.new.start(
  io: IO.new(OPEN_READ_WRITE),
  clear_console: CLEAR_CONSOLE,
  default_board_size: DEFAULT_BOARD_SIZE,
  default_symbols: DEFAULT_SYMBOLS
)
