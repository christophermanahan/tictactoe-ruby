require './lib/user_interface'

class MockBoardFormatter
  def format_board(board)
    "|#{board}|"
  end
end

class MockDisplayer
  attr_accessor :log

  def display(formatted_string)
    self.log = formatted_string
  end
end

class MockInput
  def get
    '1'
  end
end

describe 'user_interface' do
  let(:displayer) do
    MockDisplayer.new
  end

  it 'Displays the formatted board' do
    user_interface = UserInterface.new(
      board_formatter: MockBoardFormatter.new,
      displayer: displayer,
      input: MockInput.new
    )
    user_interface.display_board('[]')
    expect(displayer.log).to eq '|[]|'
  end

  it 'Gets user input' do
    user_interface = UserInterface.new(
      board_formatter: MockBoardFormatter.new,
      displayer: displayer,
      input: MockInput.new
    )
    expect(user_interface.get).to eq '1'
  end
end
