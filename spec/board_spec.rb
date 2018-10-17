require "./lib/board"
require "./lib/cell"

describe "board" do
  let (:board) do
    Board.new(Array.new(9) { Cell.new } )
  end

  it "Has a method get_board that returns a representation of the board with the player_number of each position if occupied" do
    board.place_move_on_board("X", 1)
    expect(board.get_board).to eq ["X", nil, nil, nil, nil, nil, nil, nil, nil]
  end

  it "Has a method full that returns false if place_move_on_board has not been called on all cells" do
    board.place_move_on_board("X", 1)
    board.place_move_on_board("O", 2)
    expect(board.full?).to eq(false)
  end

  it "Has a method full that returns true if place_move_on_board has been called on all cells" do
    for position in 1..9 do
      board.place_move_on_board("X", position)
    end
    expect(board.full?).to eq(true)
  end
end
