require "./lib/main"

open_read_write = 1

Main.new.start(IO.new(open_read_write))
