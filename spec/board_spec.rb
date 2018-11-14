require './lib/board'
require './lib/cell'

describe 'board' do
  it 'retrieves the symbol at a position' do
    board = Board.new(Array.new(9) { Cell.new(nil) }, 3)
    board = board.put(symbol: 'X', at: 1)
    expect(board.get(at: 1)).to eq 'X'
  end

  it 'retrieves the winning combinations of the board' do
    board = Board.new(Array.new(9) { Cell.new(nil) }, 3)
    board = board.put(symbol: 'X', at: 1)
    board = board.put(symbol: 'X', at: 3)
    board = board.put(symbol: 'X', at: 9)
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

  it 'can check if a board is full' do
    board = Board.new(Array.new(9) { Cell.new(nil) }, 3)
    board = board.put(symbol: 'X', at: 1)
    board = board.put(symbol: 'X', at: 2)
    board = board.put(symbol: 'X', at: 3)
    board = board.put(symbol: 'X', at: 4)
    board = board.put(symbol: 'X', at: 5)
    board = board.put(symbol: 'X', at: 6)
    board = board.put(symbol: 'X', at: 7)
    board = board.put(symbol: 'X', at: 8)
    board = board.put(symbol: 'X', at: 9)
    expect(board.full?).to eq true
  end

  it 'can check if a board is not full' do
    board = Board.new(Array.new(9) { Cell.new(nil) }, 3)
    expect(board.full?).to eq false
  end

  it 'retrieves the available board positions' do
    board = Board.new(Array.new(9) { Cell.new(nil) }, 3)
    board = board.put(symbol: 'X', at: 1)
    expect(board.available_positions).to eq [2, 3, 4, 5, 6, 7, 8, 9]
  end
end
