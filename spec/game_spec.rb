require './lib/game'
require './lib/presenter'

class FakeBoard
  attr_accessor :moves_until_full, :latest_move
  attr_reader :size

  def initialize(moves_until_full:)
    @moves_until_full = moves_until_full
    @size = 1
  end

  def combinations
    moves_until_full.zero? ? [[0]] : [[0, 1]]
  end

  def get(*)
    'board'
  end

  def put(symbol:, at:)
    self.moves_until_full -= 1
    self.latest_move = [symbol, at]
  end
end

class FakeMessages
  def current(player:)
    "current #{player}"
  end

  def winning(player:)
    "winning #{player}"
  end
end

class GetOneInput
  def get
    '1'
  end
end

class FakePresenter
  attr_accessor :log

  def initialize
    @log = []
  end

  def present(board:, message:)
    log << board.get
    log << message
  end
end

def default_game(
  board: FakeBoard.new(moves_until_full: 2),
  presenter: FakePresenter.new
)
  Game.new(
    board: board,
    symbols: %w[O X].cycle,
    messages: FakeMessages.new,
    input: GetOneInput.new,
    presenter: presenter
  )
end

describe 'game' do
  it 'Puts the current players move on the board if it is not full' do
    board = FakeBoard.new(moves_until_full: 1)
    default_game(board: board).run
    expect(board.latest_move).to eq %w[X 1]
  end

  it 'Puts the next players move on the board if it is still not full' do
    board = FakeBoard.new(moves_until_full: 2)
    default_game(board: board).run
    expect(board.latest_move).to eq %w[O 1]
  end

  it 'Displays the first player message' do
    presenter = FakePresenter.new
    default_game(presenter: presenter).run
    expect(presenter.log.include?('current X')).to eq true
  end

  it 'Displays the second player message' do
    presenter = FakePresenter.new
    default_game(presenter: presenter).run
    expect(presenter.log.include?('current O')).to eq true
  end

  it 'Displays the board' do
    presenter = FakePresenter.new
    default_game(presenter: presenter).run
    expect(presenter.log.include?('board')).to eq true
  end

  it 'Displays the winning player' do
    presenter = FakePresenter.new
    default_game(presenter: presenter).run
    expect(presenter.log.last).to eq 'winning O'
  end
end
