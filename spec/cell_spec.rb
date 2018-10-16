require "./lib/cell.rb"

describe "cell" do
	let (:cell) { cell = Cell.new }

	it "Has a method set_move that sets the move to the provided player symbol" do
		cell.set_move("X")
		expect(cell.move).to eq "X"
	end

	it "Returns false from empty? after a player is set" do
		cell.set_move("X")
		expect(cell.empty?).to eq false
	end
end
