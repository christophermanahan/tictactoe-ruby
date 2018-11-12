require './lib/game'
require './lib/presenter'

class MockBoard
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

class SpyMessages
  def current(player:)
    "current #{player}"
  end

  def winning(player:)
    "winning #{player}"
  end
end

class StubPlayer
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def make_move
    '1'
  end
end

class SpyPresenter
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
  board: MockBoard.new(moves_until_full: 2),
  presenter: SpyPresenter.new
)
  Game.new(
    board: board,
    players: [StubPlayer.new('O'), StubPlayer.new('X')].cycle,
    messages: SpyMessages.new,
    presenter: presenter
  )
end

describe 'game' do
  it 'puts the current players move on the board if it is not full' do
    board = MockBoard.new(moves_until_full: 1)
    default_game(board: board).run
    expect(board.latest_move).to eq %w[X 1]
  end

  it 'puts the next players move on the board if it is still not full' do
    board = MockBoard.new(moves_until_full: 2)
    default_game(board: board).run
    expect(board.latest_move).to eq %w[O 1]
  end

  it 'displays the first player message' do
    presenter = SpyPresenter.new
    default_game(presenter: presenter).run
    expect(presenter.log.include?('current X')).to eq true
  end

  it 'displays the second player message' do
    presenter = SpyPresenter.new
    default_game(presenter: presenter).run
    expect(presenter.log.include?('current O')).to eq true
  end

  it 'displays the board' do
    presenter = SpyPresenter.new
    default_game(presenter: presenter).run
    expect(presenter.log.include?('board')).to eq true
  end

  it 'displays the winning player' do
    presenter = SpyPresenter.new
    default_game(presenter: presenter).run
    expect(presenter.log.last).to eq 'winning O'
  end
end
