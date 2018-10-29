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

    def initialize
      @size = 3
    end

    def get(position) end
  end

  let(:displayer) { DisplayLogger.new }

  let(:board) { GetOnlyBoard.new }

  let(:test_message) { 'message' }

  let(:clear) { "\e[H\e[2J" }

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
    presenter = Presenter.new(
      displayer: displayer,
      clear: clear,
      board: board
    )
    presenter.present(test_message)
    expect(displayer.log.first).to eq clear
  end

  it 'displays the board' do
    presenter = Presenter.new(
      displayer: displayer,
      clear: clear,
      board: board
    )
    presenter.present(test_message)
    expect(displayer.log.include?(formatted_board_string)).to eq true
  end

  it 'displays the message' do
    presenter = Presenter.new(
      displayer: displayer,
      clear: clear,
      board: board
    )
    presenter.present(test_message)
    expect(displayer.log.include?(test_message)).to eq true
  end
end
