require "./lib/board_formatter"

describe "board_formatter" do
  let (:board_formatter) do
    BoardFormatter.new
  end

  let (:board_array) do
    [["X", nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  let (:formatted_board_string) do
      "+-----+-----+-----+\n"\
      "|  X  |  2  |  3  |\n"\
      "+-----+-----+-----+\n"\
      "|  4  |  5  |  6  |\n"\
      "+-----+-----+-----+\n"\
      "|  7  |  8  |  9  |\n"\
      "+-----+-----+-----+"
  end

  it "Has a method format_board that takes a board_array and returns a formatted board string" do
    expect(board_formatter.format_board(board_array)).to eq formatted_board_string
  end
end
