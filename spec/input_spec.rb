require "./lib/input"

class MockIO
	def gets()
		1
	end
end

describe "input" do
	let (:input) do
		Input.new(MockIO.new)
	end

	it "Has a method get that calls gets and returns the input" do
		expect(input.get).to eq 1
	end
end
