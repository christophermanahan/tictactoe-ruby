require "./lib/cell"
require "./lib/board"
require "./lib/board_formatter"
require "./lib/displayer"
require "./lib/input"
require "./lib/game"

class Main
  def start(io)
    cells = Array.new(9) do
      Cell.new
    end
    board = Board.new(cells)
    board_formatter = BoardFormatter.new
    symbols = ["X", "O"]
    displayer = Displayer.new(io)
    input = Input.new(io)
    game = Game.new(board, board_formatter, symbols, displayer, input)
    game.run
  end
end
