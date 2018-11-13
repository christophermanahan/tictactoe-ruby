require './lib/game'
require './lib/presenter'

describe 'game' do
  class WonBoard
    def combinations
      [%w[X X X]]
    end
  end

  class ContinueBoard
    def combinations
      [['X', nil, 'X']]
    end
  end

  class TieBoard
    def full?
      true
    end

    def combinations
      [%w[X O X]]
    end
  end

  class PutBoard
    def put(symbol:, at:)
      symbol + at
    end
  end

  class AvailableBoard
    def available_positions
      'available'
    end
  end

  it 'can check if a game has been won' do
    game = Game.new(WonBoard.new)
    expect(game.win?).to eq true
  end

  it 'can check if a game has not been won' do
    game = Game.new(ContinueBoard.new)
    expect(game.win?).to eq false
  end

  it 'can check if a game is a tie' do
    game = Game.new(TieBoard.new)
    expect(game.tie?).to eq true
  end

  it 'can place a move on a board' do
    game = Game.new(PutBoard.new)
    expect(game.move(symbol: 'X', to: '1')).to eq 'X1'
  end

  it 'can get the available moves' do
    game = Game.new(AvailableBoard.new)
    expect(game.available_moves).to eq 'available'
  end
end
