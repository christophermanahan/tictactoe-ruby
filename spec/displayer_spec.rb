require "./lib/displayer"

class MockIO
	def puts(formatted_string)
		formatted_string
	end
end

describe "displayer" do
	let (:displayer) do
		Displayer.new(MockIO.new)
	end

	it "Has a method display that calls puts with the provided formatted_string" do
		formatted_string = "test"
		expect(displayer.display(formatted_string)).to eq formatted_string
	end
end
