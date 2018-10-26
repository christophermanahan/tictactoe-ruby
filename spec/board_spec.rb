require './lib/board'
require './lib/cell'

describe 'board' do
  let(:board) do
    Board.new(Array.new(9) { Cell.new })
  end

  it 'Retrieves the combinations of the board' do
    board.put('X', 1)
    board.put('X', 3)
    expect(board.combinations).to eq [
      [
        ['X', nil, 'X'],
        [nil, nil, nil],
        [nil, nil, nil]
      ],
      [
        ['X', nil, nil],
        [nil, nil, nil],
        ['X', nil, nil]
      ],
      [
        ['X', nil, nil],
        ['X', nil, nil]
      ]
    ]
  end
end
