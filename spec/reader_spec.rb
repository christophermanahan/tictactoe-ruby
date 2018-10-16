require "./lib/reader"

class MockIO
	def gets()
		"test"
	end
end

describe "reader" do
	let (:reader) { reader = Reader.new(MockIO.new) } 

	it "Has a method retrieve_value that calls gets and returns the input" do
		expect(reader.retrieve_value).to eq "test"
	end
end

