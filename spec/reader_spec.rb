require "./lib/reader"

describe "reader" do
	it "Has a method read that calls gets and returns the input" do
		reader = Reader.new
		test_message = "test"
		allow($stdin).to receive(:gets).and_return(test_message)
		input = reader.read()
		expect(input).to eq test_message
	end
end
