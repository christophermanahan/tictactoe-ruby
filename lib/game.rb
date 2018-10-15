require "./lib/writer"
require "./lib/reader"
require "./lib/board_formatter"
require "./lib/cell"
require "./lib/board"
require "./lib/player"
require "./lib/players"
require "./lib/player_view"
require "./lib/player_views"

class Game
	def start(io)
		writer = Writer.new(io)
		reader = Reader.new(io)
		board = Board.new(3, Cell)
		players = Players.new(2, Player, reader, board, 0)
		player_views = PlayerViews.new(PlayerView, ["X", "O"])
		board_formatter = BoardFormatter.new(board, player_views)
		run(board, players, board_formatter writer)
	end

	def run(board, players, board_formatter, writer)
		display_board(board_formatter, writer)
		if !board.full?
			move(writer, players)
			run(board, players, view)
		end
	end

	private
	def display_board(board_formatter, writer)
		formatted_board = board_formatter(board.number_array)
		writer.write(formatted_board)
	end

	def move(writer, players)
		writer.write("Choose a Move! (0-8)")
		players.make_move()
	end
end
