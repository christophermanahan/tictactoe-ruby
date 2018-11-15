require './lib/input'

class MockIO
  def gets
    1
  end
end

describe 'input' do
  class MockIO
    attr_accessor :called

    def gets
      true
    end

    def iflush
      self.called = true
    end
  end

  let(:io) { MockIO.new }

  context 'receives clean input'
  let(:input) { Input.new(io) }

  it 'flushes input' do
    input.get
    expect(io.called).to eq true
  end

  it 'receives input' do
    expect(input.get).to eq true
  end
end
