require './lib/presenter'

describe 'presenter' do
  class DisplayLogger
    attr_reader :log

    def initialize
      @log = []
    end

    def display(message)
      log << message
    end
  end

  class GetOnlyBoard
    attr_reader :size

    def initialize(size)
      @size = size
    end

    def get(position:)
      position
    end
  end

  def default_presenter(displayer)
    Presenter.new(
      displayer: displayer,
      clear: clear
    )
  end

  let(:clear) { "\e[H\e[2J" }

  let(:displayer) { DisplayLogger.new }

  let(:board) { GetOnlyBoard.new(3) }

  let(:test_message) { 'message' }

  let(:formatted_board_string) do
    "+-----+-----+-----+\n"\
    "|  1  |  2  |  3  |\n"\
    "+-----+-----+-----+\n"\
    "|  4  |  5  |  6  |\n"\
    "+-----+-----+-----+\n"\
    "|  7  |  8  |  9  |\n"\
    '+-----+-----+-----+'
  end

  it 'clears the display' do
    presenter = default_presenter(displayer)
    presenter.present(board: board, message: test_message)
    expect(displayer.log.first).to eq clear
  end

  it 'displays the board' do
    presenter = default_presenter(displayer)
    presenter.present(board: board, message: test_message)
    expect(displayer.log.include?(formatted_board_string)).to eq true
  end

  it 'displays the message' do
    presenter = default_presenter(displayer)
    presenter.present(board: board, message: test_message)
    expect(displayer.log.include?(test_message)).to eq true
  end
end
