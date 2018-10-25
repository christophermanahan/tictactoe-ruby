require './lib/formatter'

describe 'formatter' do
  let(:formatter) do
    Formatter.new
  end

  let(:board) do
    [['X', nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  let(:formatted_board_string) do
    "+-----+-----+-----+\n"\
    "|  X  |  2  |  3  |\n"\
    "+-----+-----+-----+\n"\
    "|  4  |  5  |  6  |\n"\
    "+-----+-----+-----+\n"\
    "|  7  |  8  |  9  |\n"\
    '+-----+-----+-----+'
  end

  it 'Formats the board into a printable board string' do
    expect(formatter.format(board)).to eq formatted_board_string
  end
end
