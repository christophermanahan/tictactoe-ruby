require './lib/colorizer'

describe 'colorizer' do
  let(:test) { 'test' }

  context 'colors not supported' do
    let(:colorizer_unsupported) { Colorizer.new(1) }

    it 'only colors a string if supported' do
      expect(colorizer_unsupported.position(test)).to eq test
    end
  end

  context 'colors supported' do
    let(:colorizer_supported) { Colorizer.new(8) }

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
end
