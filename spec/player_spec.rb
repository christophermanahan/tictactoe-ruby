require './lib/player'

describe 'player' do
  class StubMoveMaker
    def get
      '1'
    end
  end

  let(:player) do
    Player.new(
      move_maker: StubMoveMaker.new,
      symbol: 'X'
    )
  end

  it 'can make a move' do
    expect(player.make_move).to eq '1'
  end

  it 'has a symbol' do
    expect(player.symbol).to eq 'X'
  end
end
