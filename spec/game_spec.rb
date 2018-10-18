require "./lib/game"

class MockBoard
  attr_accessor :moves_until_full, :latest_move

  def initialize(moves_until_full)
    @moves_until_full = moves_until_full
    @latest_move = []
  end

  def rows()
    "[#{latest_move.join(" ")}]"
  end

  def full?()
    moves_until_full == 0
  end

  def put(symbol, position)
    self.moves_until_full -= 1
    self.latest_move = [symbol, position]
  end
end

class MockBoardFormatter
  def format_board(board)
    "|#{board}|"
  end
end

class MockDisplayer
  attr_accessor :log

  def display(formatted_string)
    self.log = formatted_string
  end
end

class MockInput
  def get()
    "1"
  end
end

describe "game" do
  let (:displayer) do
    MockDisplayer.new
  end

  let (:symbols) do
    symbols = ["X", "O"].cycle
  end

  it "Displays the formatted board" do
    game = Game.new(board: MockBoard.new(0), board_formatter: MockBoardFormatter.new, displayer: displayer, input: MockInput.new, symbols: symbols)
    game.run
    expect(displayer.log).to eq "|[]|"
  end

  it "Puts the current player's move on the board if it is not full" do
    game = Game.new(board: MockBoard.new(1), board_formatter: MockBoardFormatter.new, displayer: displayer, input: MockInput.new, symbols: symbols)
    game.run
    expect(displayer.log).to eq "|[X 1]|"
  end

  it "Puts the next player's move on the board if it is still not full" do
    game = Game.new(board: MockBoard.new(2), board_formatter: MockBoardFormatter.new, displayer: displayer, input: MockInput.new, symbols: symbols)
    game.run
    expect(displayer.log).to eq "|[O 1]|"
  end
end
