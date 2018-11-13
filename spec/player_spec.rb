require './lib/player'

describe 'player' do
  class StubMove
    def get
      '1'
    end
  end

  class StubGame
    def move(symbol:, to:)
      symbol + to
    end
  end

  it 'play a turn of the game' do
    player = Player.new(
      move: StubMove.new,
      symbol: 'X'
    )
    game = StubGame.new
    expect(player.play(game)).to eq 'X1'
  end
end
