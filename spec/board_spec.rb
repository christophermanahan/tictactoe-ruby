require './lib/board'
require './lib/cell'

describe 'board' do
  let(:board) do
    Board.new(Array.new(9) { Cell.new }, 3)
  end

  it 'Retrieves the symbol at a position' do
    board.put(symbol: 'X', at: 1)
    expect(board.get(at: 1)).to eq 'X'
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

  it 'Retrieves the available board positions' do
    board.put(symbol: 'X', at: 1)
    expect(board.available_positions).to eq [2, 3, 4, 5, 6, 7, 8, 9]
  end
end
