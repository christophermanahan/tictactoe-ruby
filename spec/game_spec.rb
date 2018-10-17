require "./lib/game"

class MockBoard
  attr_accessor :full, :count
  attr_reader :times, :moves

  def initialize(full, times)
    @full = full
    @times = times
    @moves = []
    @count = 0
  end

  def get_board
    "board"
  end

  def full?
    full
  end

  def set_symbol(symbol, position)
    if count == times
      @full = true
      moves
    else
      @count += 1
      moves << [symbol, position]
    end
  end

  private
  attr_accessor :full, :count
end

class MockBoardFormatter
  def format_board(board_array)
    board_array
  end
end

class MockDisplayer
  attr_accessor :display_calls

  def initialize()
    @display_calls = []
  end

  def display(string)
    @display_calls << string
  end
end

class MockInput
  def get
    1
  end
end

describe "game" do
  let (:board) do
    MockBoard.new(false, 2)
  end

  let (:board_formatter) do
    MockBoardFormatter.new
  end

  let (:displayer) do
    MockDisplayer.new
  end

  let (:input) do
    MockInput.new
  end

  let (:game) do
    Game.new(board, board_formatter, ["X", "O"], displayer, input)
  end

  it "Has a method run that displays the board and displays the move prompt" do
    game.run
    move_prompt = "Choose a Move! (1-9)"
    display_board = "board"
    expect(displayer.display_calls).to eq [
      display_board,
      move_prompt,
      display_board,
      move_prompt,
      display_board,
      move_prompt,
      display_board
    ]
  end

  it "Has a method run that calls boards set symbol method with the current symbol and result of input when board is not full" do
    game.run
    expect(board.moves).to eq [["X", 1], ["O", 1]]
  end
end
