require "./lib/board"
require "./lib/cell"

describe "board" do
	let (:board) { board = Board.new(3, Cell) }

	it "Is initialized with cells set to a size*size length array" do
		expect(board.cells.count).to eq 9
	end

	it "Is initialized with a model array containing instances of cell" do
		expect(board.cells).to all(be_a(Cell))
	end

	it "Has a method set_player that invokes the setPlayer method on a cell at coordinate with provided number" do
		target_cell = board.cells[0]
		expect(target_cell).to receive(:set_player)
		board.set_player(0, 0)
	end
end
