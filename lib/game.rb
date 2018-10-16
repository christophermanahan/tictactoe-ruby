require "./lib/writer"
require "./lib/reader"
require "./lib/cell"
require "./lib/board"
require "./lib/player"
require "./lib/board_formatter"

class Game
	def start(io)
		writer = Writer.new(io)
		reader = Reader.new(io)
		board = Board.new(3, Cell) # Have to remove cell here... ugh
		players = [Player.new("X", reader, board), Player.new("O", reader, board)]
		board_formatter = BoardFormatter.new(board)
		run(board, players, board_formatter, writer)
	end

	def run(board, players, board_formatter, writer)
		display_board(board_formatter, writer)
		if !board.full?
			move(writer, players)
			run(board, players.reverse, board_formatter, writer)
		end
	end

	private
	def display_board(board_formatter, writer)
		formatted_board = board_formatter.format_board
		writer.write(formatted_board)
	end

	def move(writer, players)
		writer.write("Choose a Move! (1-9)")
		players[0].make_move()
	end
end
