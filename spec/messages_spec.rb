require './lib/messages'

describe 'messages' do
  let (:messages) { Messages.new }

  it 'builds a current player message' do
    expect(messages.current(player: 'X')).to eq 'Player X choose a board position!'
  end

  it 'builds a winning player message' do
    expect(messages.winning(player: 'X')).to eq 'Player X wins!'
  end
end
