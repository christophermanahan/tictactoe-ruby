require './lib/player'

describe 'player' do
  class StubMoveMaker
    def get
      '1'
    end
  end

  let(:move_message) { 'move' }

  let(:win_message) { 'win' }

  let(:player) do
    Player.new(
      move_maker: StubMoveMaker.new,
      symbol: 'X',
      move_message: move_message,
      win_message: win_message
    )
  end

  it 'can make a move' do
    expect(player.make_move).to eq '1'
  end

  it 'has a symbol' do
    expect(player.symbol).to eq 'X'
  end

  it 'has a move message' do
    expect(player.move_message).to eq move_message
  end

  it 'has a win message' do
    expect(player.win_message).to eq win_message
  end
end
