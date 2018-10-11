require "./lib/writer"
require "./lib/reader"
require "./lib/controller"
require "./lib/cell"
require "./lib/board"
require "./lib/player"
require "./lib/players"
require "./lib/player_view"
require "./lib/player_views"
require "./lib/view"

class Game
	def start(io)
		writer = Writer.new(io)
		reader = Reader.new(io)
		controller = Controller.new("Choose a Move! (0-8)", writer, reader)
		board = Board.new(3, Cell)
		players = Players.new(2, Player, controller, board, 0)
		player_views = PlayerViews.new(PlayerView, ["X", "O"])
		view = View.new(player_views, writer)
		run(board, players, view)
	end

	def run(board, players, view)
		view.display_board(board.number_array)
		if not board.full?
			players.make_move()
			run(board, players, view)
		end
	end
end
