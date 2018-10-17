require "./lib/cell.rb"

describe "cell" do
  let (:cell) do
    Cell.new
  end

  it "Has a method fill that sets the symbol to the provided player symbol" do
    cell.fill("X")
    expect(cell.symbol).to eq "X"
  end

  it "Returns false from empty? after a player is set" do
    cell.fill("X")
    expect(cell.empty?).to eq false
  end
end
