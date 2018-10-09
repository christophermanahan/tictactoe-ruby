require "./lib/coordinate"

describe "coordinate" do
	it "Is initialized with and returns a position" do
		coordinate = Coordinate.new(1)
		expect(coordinate.position).to eq 1
	end
end
