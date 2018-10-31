require './lib/formatter'

class GetOnlyBoard
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def get(at:)
    at
  end
end

describe 'formatter' do
  let(:formatted_board_string) do
    "+-----+-----+-----+\n"\
    "|  1  |  2  |  3  |\n"\
    "+-----+-----+-----+\n"\
    "|  4  |  5  |  6  |\n"\
    "+-----+-----+-----+\n"\
    "|  7  |  8  |  9  |\n"\
    '+-----+-----+-----+'
  end

  it 'formats the board' do
    formatter = Formatter.new
    board = GetOnlyBoard.new(3)
    expect(formatter.format(board)).to eq formatted_board_string
  end
end
