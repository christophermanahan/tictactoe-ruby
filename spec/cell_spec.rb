require "./lib/cell.rb"

describe "cell" do
	let (:cell) { cell = Cell.new }

	it "Has a method set_symbol that sets the symbol to the provided player symbol" do
		cell.set_symbol("X")
		expect(cell.symbol).to eq "X"
	end

	it "Returns false from empty? after a player is set" do
		cell.set_symbol("X")
		expect(cell.empty?).to eq false
	end
end
