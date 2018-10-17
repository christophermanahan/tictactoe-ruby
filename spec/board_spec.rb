require "./lib/board"
require "./lib/cell"

describe "board" do
  let (:board) do
    Board.new(Array.new(9) { Cell.new } )
  end

  it "Retrieves the rows of the board" do
    board.place_move_on_board("X", 1)
    expect(board.rows).to eq [["X", nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  it "Is false when the board is not full" do
    board.place_move_on_board("X", 1)
    board.place_move_on_board("O", 2)
    expect(board.full?).to eq(false)
  end

  it "Is true when the board is full" do
    for position in 1..9 do
      board.place_move_on_board("X", position)
    end
    expect(board.full?).to eq(true)
  end
end
