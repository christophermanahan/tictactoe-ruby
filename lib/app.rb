require './lib/main'

OPEN_READ_WRITE = 1
CLEAR_CONSOLE = `clear`.freeze
COLOR_COUNT = `tput colors`.to_i.freeze
DEFAULT_BOARD_SIZE = 3
DEFAULT_SYMBOLS = %w[X O].freeze

Main.new.start(
  io: IO.new(OPEN_READ_WRITE),
  clear_console: CLEAR_CONSOLE,
  color_count: COLOR_COUNT,
  default_board_size: DEFAULT_BOARD_SIZE,
  default_symbols: DEFAULT_SYMBOLS
)
