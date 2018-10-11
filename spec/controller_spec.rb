require "./lib/controller"
require "./lib/writer"

class MockWriter
	def write(write_message)
		return 0
	end
end

class MockReader
	def read()
		"test"
	end
end

describe "controller" do
	let (:test_message) { test_message = "test" }
	let (:controller) { controller = Controller.new(test_message, MockWriter.new, MockReader.new) }

	it "Is initialized with a write_message" do
		expect(controller.write_message).to eq test_message
	end

	it "Is initialized with a writer" do
		expect(controller.writer).to be_a(MockWriter)
	end

	it "Is initialized with a reader" do
		expect(controller.reader).to be_a(MockReader)
	end

	it "Has a method retrieve_value that calls write with the write message" do
		expect(controller.writer).to receive(:write).with(test_message)
		controller.retrieve_value
	end

	it "Has a method retrieve_value that calls read and returns the result" do
		expect(controller.reader).to receive(:read).and_return(test_message)
		controller.retrieve_value
	end
end
