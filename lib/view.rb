class View
	def initialize(player_views, writer)
		@player_views = player_views
		@writer = writer
	end

	def display_board(player_numbers)
		writer.write(format_board(player_numbers))
	end

	def format_board(player_numbers)
		formatted_board = []
		board_strings = board_strings(player_numbers)
		length = player_numbers.size

		size = Math.sqrt(length)
		formatted_board << divider(size)

		(0..length-1).step(size) do |row_start|
			formatted_board << row_string(board_strings[row_start..row_start+size-1])
			formatted_board << divider(size)
		end

		formatted_board.join("\n")
	end

	private
	attr_reader :player_views, :writer

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

	def divider(size)
		"+#{Array.new(size).fill("-----").join("+")}+"
	end

	def row_string(row)
		"|  #{row.join("  |  ")}  |"
	end
end
