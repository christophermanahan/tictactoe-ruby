require './lib/user_interface'

class MockBoardFormatter
  def format_board(board)
    "|#{board}|"
  end
end

class MockDisplayer
  def display(formatted_string)
    formatted_string
  end
end

class MockInput
  def get
    '1'
  end
end

describe 'user_interface' do
  let(:user_interface) do
    UserInterface.new(
      board_formatter: MockBoardFormatter.new,
      displayer: MockDisplayer.new,
      input: MockInput.new
    )
  end

  it 'Displays the formatted board' do
    expect(user_interface.display_board('[]')).to eq '|[]|'
  end

  it 'Gets user input' do
    expect(user_interface.get).to eq '1'
  end
end
