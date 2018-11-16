require './lib/colorizer'

describe 'colorizer' do
  let(:colorizer_unsupported) { Colorizer.new(1) }

  let(:colorizer_supported) { Colorizer.new(8) }

  let(:test) { 'test' }

  it 'only colors a string if supported' do
    expect(colorizer_unsupported.blue(test)).to eq test
  end

  it 'colors a string blue if supported' do
    expect(colorizer_supported.blue(test)).to eq "\e[34m#{test}\e[0m"
  end

  it 'colors a string yellow if supported' do
    expect(colorizer_supported.yellow(test)).to eq "\e[33m#{test}\e[0m"
  end

  it 'colors a string cyan if supported' do
    expect(colorizer_supported.cyan(test)).to eq "\e[36m#{test}\e[0m"
  end
end
