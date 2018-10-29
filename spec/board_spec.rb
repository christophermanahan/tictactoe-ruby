require './lib/board'
require './lib/cell'

describe 'board' do
  let(:board) do
    Board.new(Array.new(9) { Cell.new })
  end

  it 'Retrieves the symbol at a position' do
    board.put(symbol: 'X', at: 1)
    expect(board.get(position: 1)).to eq 'X'
  end

  it 'Retrieves the combinations of the board' do
    board.put(symbol: 'X', at: 1)
    board.put(symbol: 'X', at: 3)
    board.put(symbol: 'X', at: 9)
    expect(board.combinations).to eq [
      ['X', nil, 'X'],
      [nil, nil, nil],
      [nil, nil, 'X'],
      ['X', nil, nil],
      [nil, nil, nil],
      ['X', nil, 'X'],
      ['X', nil, 'X'],
      ['X', nil, nil]
    ]
  end
end
