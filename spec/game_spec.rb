require './lib/game'

class MockBoard
  attr_accessor :moves_until_full, :latest_move

  def initialize(moves_until_full)
    @moves_until_full = moves_until_full
    @latest_move = []
  end

  def rows
    if moves_until_full == 0
      [["#{latest_move.join(' ')}"]]
    else
      [[0, 1]]
    end
  end

  def columns
    rows
  end

  def diagonals
    rows
  end

  def full?
    moves_until_full == 0
  end

  def put(symbol, position)
    self.moves_until_full -= 1
    self.latest_move = [symbol, position]
  end
end

class MockUserInterface
  attr_accessor :log

  def display(formatted_string)
    self.log = formatted_string
  end

  def get_input
    '1'
  end
end

describe 'game' do
  let(:user_interface) do
    MockUserInterface.new
  end

  it 'Displays the game board' do
    game = Game.new(
      board: MockBoard.new(0),
      symbols: %w[X O].cycle,
      user_interface: user_interface
    )
    game.run
    expect(user_interface.log).to eq [['']]
  end

  it 'Puts the current players move on the board if it is not full' do
    game = Game.new(
      board: MockBoard.new(1),
      symbols: %w[X O].cycle,
      user_interface: user_interface
    )
    game.run
    expect(user_interface.log).to eq [['X 1']]
  end

  it 'Puts the next players move on the board if it is still not full' do
    game = Game.new(
      board: MockBoard.new(2),
      symbols: %w[X O].cycle,
      user_interface: user_interface
    )
    game.run
    expect(user_interface.log).to eq [['O 1']]
  end

  it 'Checks if a board has been won' do
    combinations = [
      [['X', 'X', 'X'],
      [nil, nil, nil],
      [nil, nil, nil]]
    ]
    game = Game.new(
      board: MockBoard.new(0),
      symbols: %w[X O].cycle,
      user_interface: user_interface
    )
    expect(game.win?(combinations)).to eq true
  end

  it 'Checks if a board has not been won' do
    combinations = [
      [['X', nil, 'X'],
      [nil, nil, nil],
      [nil, nil, nil]]
    ]
    game = Game.new(
      board: MockBoard.new(0),
      symbols: %w[X O].cycle,
      user_interface: user_interface
    )
    expect(game.win?(combinations)).to eq false
  end
end
