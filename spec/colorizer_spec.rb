require './lib/colorizer'

describe 'colorizer' do
  let(:colorizer) { Colorizer.new }

  let(:test_string) { 'test' }

  it 'colors a string magenta' do
    expect(colorizer.magenta(test_string)).to eq "\e[35m#{test_string}\e[0m"
  end

  it 'colors a string yellow' do
    expect(colorizer.yellow(test_string)).to eq "\e[33m#{test_string}\e[0m"
  end

  it 'colors a string cyan' do
    expect(colorizer.cyan(test_string)).to eq "\e[36m#{test_string}\e[0m"
  end
end
