require './lib/cell.rb'

describe 'cell' do
  let(:cell) { Cell.new(nil) }

  it 'Sets the symbol' do
    expect(cell.fill('X').symbol).to eq 'X'
  end

  it 'Is true if a symbol has not been set' do
    expect(cell.empty?).to eq true
  end

  it 'Is false if a symbol has been set' do
    expect(cell.fill('X').empty?).to eq false
  end
end
