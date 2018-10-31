require './lib/main'

OPEN_READ_WRITE = 1
CLEAR_CONSOLE = "\e[H\e[2J".freeze
DEFAULT_BOARD_SIZE = 3

Main.new.start(IO.new(OPEN_READ_WRITE), CLEAR_CONSOLE, DEFAULT_BOARD_SIZE)
