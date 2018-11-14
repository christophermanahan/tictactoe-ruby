require './lib/loop'

describe 'loop' do
  class MockGame
    attr_accessor :turns
    def initialize(turns)
      @turns = turns
    end

    def string
      'game'
    end

    def over?
      self.turns -= 1
      turns.zero?
    end
  end

  class SymbolPlayer
    attr_reader :symbol
    attr_accessor :log

    def initialize(symbol)
      @symbol = symbol
    end

    def play(game)
      self.log = [game.string, symbol]
    end
  end

  class StubPresenter
    attr_accessor :log

    def present(game:, player:)
      self.log = [game.string, player.symbol]
    end
  end

  let(:presenter) { StubPresenter.new }

  let(:player1) { SymbolPlayer.new('X') }

  let(:player2) { SymbolPlayer.new('O') }

  def default_loop(game, players, presenter)
    Loop.new(
      game: game,
      players: players,
      presenter: presenter
    )
  end

  it 'presents the game' do
    default_loop(MockGame.new(1), [player1, player2].cycle, presenter).run
    expect(presenter.log).to eq %w[game X]
  end

  it 'requests a player to play the game if it is not over' do
    default_loop(MockGame.new(1), [player1, player2].cycle, presenter).run
    expect(player1.log).to eq %w[game X]
  end

  it 'requests the next player to play the game if it is still not over' do
    default_loop(MockGame.new(2), [player1, player2].cycle, presenter).run
    expect(player2.log).to eq %w[game O]
  end
end
