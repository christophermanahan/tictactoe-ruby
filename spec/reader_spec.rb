require "./lib/reader"
require "mocks/mock_io"

describe "reader" do
	let (:reader) { reader = Reader.new(MockIO.new) } 

	it "Has a method read that calls gets and returns the input" do
		expect(reader.read).to eq "test"
	end
end
