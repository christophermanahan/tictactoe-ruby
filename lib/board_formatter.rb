class BoardFormatter
	def initialize(board, player_views)
		@board = board
		@player_views = player_views
	end

	def format_board(player_numbers)
		formatted_board = []
		board_builder(board_strings(player_numbers), player_numbers.count, size(length), formatted_board)
		formatted_board.join("\n")
	end

	private
	attr_reader :player_views

	def board_strings(player_numbers)
		player_views_board = player_numbers.map { |player_number| player_view(player_number) }
		player_views_board.map { |player_view| board_string(player_view) }
	end

	def player_view(player_number)
		player_views.get_player_view(player_number) if player_number
	end

	def board_string(player_view)
		player_view && player_view.symbol || " "
	end

	def size(length)
		Math.sqrt(length)
	end

	def board_builder(board_strings, length, size, formatted_board)
		formatted_board << divider(size)
		(0..length-1).step(size) do |row_start|
			add_row_and_divider(formatted_board, size)
		end
	end

	def add_row_and_divider(board_strings, size, formatted_board)
		formatted_board << row_string(board_strings[row_start..row_start+size-1])
		formatted_board << divider(size)
	end

	def divider(size)
		"+#{Array.new(size).fill("-----").join("+")}+"
	end

	def row_string(row)
		"|  #{row.join("  |  ")}  |"
	end
end
