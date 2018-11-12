require './lib/main'

OPEN_READ_WRITE = 1
CLEAR_CONSOLE = "\e[H\e[2J".freeze
DEFAULT_BOARD_SIZE = 3
DEFAULT_SYMBOLS = %w[O X].freeze
DEFAULT_MOVE_MESSAGE_PREFIX = 'Please make a selection for '.freeze
DEFAULT_WIN_MESSAGE_SUFFIX = ' has won!'.freeze

Main.new.start(
  io: IO.new(OPEN_READ_WRITE),
  clear_console: CLEAR_CONSOLE,
  default_board_size: DEFAULT_BOARD_SIZE,
  default_symbols: DEFAULT_SYMBOLS,
  default_move_message_prefix: DEFAULT_MOVE_MESSAGE_PREFIX,
  default_win_message_suffix: DEFAULT_WIN_MESSAGE_SUFFIX
)
