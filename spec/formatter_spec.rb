require './lib/formatter'

class NilOnlyBoard
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def get(*)
    nil
  end
end

class FakeColorizer
  def symbol_1(string)
    string
  end

  def symbol_2(string)
    string
  end

  def position(string)
    string
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
    formatter = Formatter.new(
      colorizer: FakeColorizer.new,
      symbols: %w[O W]
    )
    board = NilOnlyBoard.new(3)
    expect(formatter.format(board)).to eq formatted_board_string
  end
end
