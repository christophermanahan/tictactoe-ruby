require "./lib/cell.rb"

describe "cell" do
	let (:cell) { cell = Cell.new }

	it "Is initialized with player set to nil" do
		expect(cell.player).to eq nil
	end

	it "Is initialized with empty? returning true" do
		expect(cell.empty?).to eq true
	end

	it "Has a method set_player that sets the player to the provided player number" do
		cell.set_player(0)
		expect(cell.player).to eq 0
	end

	it "Returns false from empty? after a player is set" do
		cell.set_player(0)
		expect(cell.empty?).to eq false
	end
end
