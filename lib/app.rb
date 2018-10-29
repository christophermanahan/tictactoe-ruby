require './lib/main'

open_read_write = 1
clear_console = "\e[H\e[2J"

Main.new.start(IO.new(open_read_write), clear_console)
