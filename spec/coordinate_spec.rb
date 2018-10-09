require "./lib/coordinate"

describe "coordinate" do
	it "Is initialized with and returns a position" do
		coor = Coordinate.new(1)
		expect(coor.position).to eq 1
	end
end
