require "./lib/reader"

class MockIO
	def gets()
		"test"
	end
end

describe "reader" do
	it "Has a method read that calls gets and returns the input" do
		reader = Reader.new(MockIO.new)
		expect(reader.read).to eq "test"
	end
end
