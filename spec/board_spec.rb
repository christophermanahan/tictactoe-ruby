require "./lib/board"
require "./lib/cell"
require "./lib/coordinate"

describe "board" do
	let (:board) { board = Board.new(3, Cell) }

	it "Is initialized with cells set to a size*size length array" do
		expect(board.cells.count).to eq 9
	end

	it "Is initialized with a model array containing instances of cell" do
		expect(board.cells).to all(be_a(Cell))
	end

	it "Has a method setPlayer that invokes the setPlayer method on a cell at coordinate with provided number" do
		coordinate = Coordinate.new(0)
		targetCell = board.cells[coordinate.position]
		expect(targetCell).to receive(:setPlayer)
		board.setPlayer(0, coordinate)
	end
end
