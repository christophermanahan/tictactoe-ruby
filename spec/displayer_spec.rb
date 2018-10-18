require './lib/displayer'

class MockIO
  def puts(formatted_string)
    formatted_string
  end
end

describe 'displayer' do
  let(:displayer) do
    Displayer.new(MockIO.new)
  end

  it 'Displays the formatted string' do
    formatted_string = 'test'
    expect(displayer.display(formatted_string)).to eq formatted_string
  end
end
