require './lib/human'

describe 'human' do
  class StubInput
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
    human = Human.new(
      input: StubInput.new,
      symbol: 'X'
    )
    game = StubGame.new
    expect(human.play(game)).to eq 'X1'
  end
end
