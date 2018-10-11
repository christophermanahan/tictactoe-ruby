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

class Builder
	def build_writer(io)
		Writer.new(io)
	end

	def build_reader(io)
		Reader.new(io)
	end

	def build_controller(write_message, writer, reader)
		Controller.new(write_message, writer, reader)
	end

	def build_board(size)
		Board.new(size, Cell)
	end

	def build_players(num_players, player, move_maker, board, starting_player)
		Players.new(num_players, player, move_maker, board, starting_player)
	end

	def build_player_views(player_view, symbols)
		PlayerViews.new(player_view, symbols)
	end

	def build_view(player_views, writer)
		View.new(player_views, writer)
	end
end