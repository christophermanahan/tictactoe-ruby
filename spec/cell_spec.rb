require "./lib/cell.rb"

describe "cell" do
	let (:cell) { cell = Cell.new }

	it "Is initialized with symbol set to nil" do
		expect(cell.symbol).to eq nil
	end

	it "Is initialized with empty? set to true" do
		expect(cell.empty?).to eq true
	end

	it "Sets the symbol to the provided value using setMarker" do
		cell.setMarker("X")
		expect(cell.symbol).to eq "X"
	end

	it "Returns false from empty? after a symbol is set" do
		cell.setMarker("X")
		expect(cell.empty?).to eq false
	end
end
