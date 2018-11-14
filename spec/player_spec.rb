require './lib/player'

describe 'player' do
  class StubMake
    def move(*)
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
      make: StubMake.new,
      symbol: 'X'
    )
    game = StubGame.new
    expect(player.play(game)).to eq 'X1'
  end
end
