require './lib/colorizer'

describe 'colorizer' do
  let(:colorizer_unsupported) { Colorizer.new(1) }

  let(:colorizer_supported) { Colorizer.new(8) }

  let(:test) { 'test' }

  it 'only colors a string if supported' do
    expect(colorizer_unsupported.position(test)).to eq test
  end

  it 'colors symbol_1 if supported' do
    expect(colorizer_supported.symbol_1(test)).to eq "\e[34m#{test}\e[0m"
  end

  it 'colors symbol_2 if supported' do
    expect(colorizer_supported.symbol_2(test)).to eq "\e[36m#{test}\e[0m"
  end

  it 'colors a position if supported' do
    expect(colorizer_supported.position(test)).to eq "\e[33m#{test}\e[0m"
  end
end
