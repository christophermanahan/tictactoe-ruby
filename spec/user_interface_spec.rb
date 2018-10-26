require './lib/user_interface'

class MockFormatter
  def format(board)
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
      formatter: MockFormatter.new,
      displayer: MockDisplayer.new,
      input: MockInput.new
    )
  end

  it 'Displays the formatted board' do
    expect(user_interface.display('[]')).to eq '|[]|'
  end

  it 'Diplays the winner' do
    expect(user_interface.winner('X')).to eq 'X won!'
  end

  it 'Receives user input' do
    expect(user_interface.get_input).to eq '1'
  end
end
