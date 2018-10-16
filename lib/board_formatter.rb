class BoardFormatter
	def format_board(board_array)
		board_strings = board_with_moves(board_array)
		length = board_strings.count
		board_builder(board_strings, length, size(length), []).join("\n")
	end

	private
	def board_with_moves(board_array)
		board_array.each_with_index.map do |board_string, i| 
			board_string ? board_string : (i+1).to_s
		end
	end

	def size(length)
		Math.sqrt(length)
	end

	def board_builder(board_strings, length, size, formatted_board)
		formatted_board << divider(size)
		(0..length-1).step(size) do |row_start|
			add_row_and_divider(board_strings, row_start, size, formatted_board)
		end
		formatted_board
	end

	def add_row_and_divider(board_strings, row_start, size, formatted_board)
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
