class BoardFormatter
  def format_board(rows)
    filled_rows = fill_empty_positions(rows)
    board_builder(filled_rows, rows.size, formatted_board = [])
    formatted_board.join("\n")
  end

  private
  def fill_empty_positions(rows)
    flat = rows.flatten
    flat.map!.with_index do |symbol, position| 
      symbol || convert_position(position)
    end
    flat.each_slice(rows.size).to_a
  end

  def convert_position(position)
    (position+1).to_s
  end

  def board_builder(rows, size, formatted_board)
    formatted_board << divider(size)
    rows.each do |row|
      formatted_board << row_string(row)
      formatted_board << divider(size)
    end
  end

  def divider(size)
    "+#{Array.new(size).fill("-----").join("+")}+"
  end

  def row_string(row)
    "|  #{row.join("  |  ")}  |"
  end
end
