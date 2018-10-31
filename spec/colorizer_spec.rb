require './lib/colorizer'

describe 'colorizer' do
  let(:colorizer) { Colorizer.new }

  let(:test_string) { 'test' }

  it 'colors a string magenta' do
    expect(colorizer.magenta(test_string)).to eq "#{test_string} \e[35mMagenta"
  end

  it 'colors a string blue' do
    expect(colorizer.blue(test_string)).to eq "#{test_string} \e[34mBlue"
  end

  it 'colors a string cyan' do
    expect(colorizer.cyan(test_string)).to eq "#{test_string} \e[36mCyan"
  end
end
