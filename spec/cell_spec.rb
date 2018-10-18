require './lib/cell.rb'

describe 'cell' do
  let(:cell) do
    Cell.new
  end

  it 'Sets the symbol' do
    cell.fill('X')
    expect(cell.symbol).to eq 'X'
  end

  it 'Is true if a symbol has not been set' do
    expect(cell.empty?).to eq true
  end

  it 'Is false if a symbol has been set' do
    cell.fill('X')
    expect(cell.empty?).to eq false
  end
end
