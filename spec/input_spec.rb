require "./lib/input"

class MockIO
	def gets()
		"test"
	end
end

describe "input" do
	let (:input) do
		Input.new(MockIO.new)
	end

	it "Has a method retrieve_value that calls gets and returns the input" do
		expect(input.get).to eq "test"
	end
end
