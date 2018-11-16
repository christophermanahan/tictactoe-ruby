require './lib/messages'

describe 'messages' do
  let(:messages) { Messages.new }

  it 'builds a current player message' do
    expect(messages.prompt('X')).to eq 'Please make a selection for X'
  end

  it 'retrieves a tied message' do
    expect(messages.tied).to eq 'The game ended in a tie'
  end

  it 'builds a winning player message' do
    expect(messages.winning('X')).to eq 'X has won'
  end
end
