require "./lib/writer"
require "mocks/mock_io"

describe "writer" do
	let (:writer) { writer = Writer.new(MockIO.new) }

	it "Has a method write that calls puts with the provided write_message" do
		test_message = "test"
		expect(writer.write(test_message)).to eq test_message
	end
end
