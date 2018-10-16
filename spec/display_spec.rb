require "./lib/display"

class MockIO
	def puts(formatted_string)
		formatted_string
	end
end

describe "display" do
	let (:display) { Display.new(MockIO.new) }

	it "Has a method display that calls puts with the provided formatted_string" do
		formatted_string = "test"
		expect(display.display(formatted_string)).to eq formatted_string
	end
end
