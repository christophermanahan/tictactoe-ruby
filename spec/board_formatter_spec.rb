require './lib/board_formatter'

describe 'board_formatter' do
  let(:board_formatter) do
    BoardFormatter.new
  end

  let(:rows) do
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

  it 'Formats the rows into a printable board string' do
    expect(board_formatter.format_board(rows)).to eq formatted_board_string
  end
end
