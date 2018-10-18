require './lib/cell'
require './lib/board'
require './lib/board_formatter'
require './lib/displayer'
require './lib/input'
require './lib/game'

class Main
  def start(io)
    cells = Array.new(9) do
      Cell.new
    end
    board = Board.new(cells)
    board_formatter = BoardFormatter.new
    symbols = %w[X O].cycle
    displayer = Displayer.new(io)
    input = Input.new(io)
    game = Game.new(
      board: board,
      board_formatter: board_formatter,
      displayer: displayer,
      input: input,
      symbols: symbols
    )
    game.run
  end
end
