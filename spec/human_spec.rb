require './lib/human'

describe 'human' do
  class DummyGame
  end

  class StubInput
    def get
      '1'
    end
  end

  it 'gets a move' do
    human = Human.new(StubInput.new)
    expect(human.move(DummyGame.new)).to eq '1'
  end
end