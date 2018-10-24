class Formatter
  def format(board)
    filled_board = fill_empty_positions(board)
    board_builder(filled_board, board.size, formatted_board = [])
    formatted_board.join("\n")
  end

  private

  def fill_empty_positions(board)
    flat = board.flatten
    flat.map!.with_index do |symbol, position|
      symbol || convert_position(position)
    end
    flat.each_slice(board.size).to_a
  end

  def convert_position(position)
    (position + 1).to_s
  end

  def board_builder(board, size, formatted_board)
    formatted_board << divider(size)
    board.each do |row|
      formatted_board << row_string(row)
      formatted_board << divider(size)
    end
  end

  def divider(size)
    "+#{Array.new(size).fill('-----').join('+')}+"
  end

  def row_string(row)
    "|  #{row.join('  |  ')}  |"
  end
end
