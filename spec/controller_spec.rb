require "./lib/controller"
require "mocks/mock_writer"
require "mocks/mock_reader"

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
