require "./lib/writer"

describe "writer" do
	it "Has a method write that calls puts with the provided write_message" do
		writer = Writer.new
		test_message = "test"
		expect($stdin).to receive(:puts).with(test_message)
		writer.write(test_message)
	end
end
