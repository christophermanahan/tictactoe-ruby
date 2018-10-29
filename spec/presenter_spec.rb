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

  let(:displayer) { DisplayLogger.new }

  let(:clear) { "\e[H\e[2J" }

  let(:size) { 9 }

  let(:flat) { Array.new(9) }

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
    presenter = Presenter.new(
      displayer: displayer,
      clear: clear
    )
    presenter.present(board: flat, message: test_message)
    expect(displayer.log.first).to eq clear
  end

  it 'displays the board' do
    presenter = Presenter.new(
      displayer: displayer,
      clear: clear
    )
    presenter.present(board: flat, message: test_message)
    expect(displayer.log.include?(formatted_board_string)).to eq true
  end

  it 'displays the message' do
    presenter = Presenter.new(
      displayer: displayer,
      clear: clear
    )
    presenter.present(board: flat, message: test_message)
    expect(displayer.log.include?(test_message)).to eq true
  end
end
