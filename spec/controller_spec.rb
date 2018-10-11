require "./lib/controller"
require "./lib/writer"

class MockWriter
	def write(write_message)
		write_message
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
	
	it "Has a method retrieve_value that calls write with the write message" do
		expect(controller.retrieve_value).to eq test_message
	end

	it "Has a method retrieve_value that calls read and returns the result" do
		expect(controller.retrieve_value).to eq test_message
	end
end
