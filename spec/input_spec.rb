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

  it "Receives input from the console" do
    expect(input.get).to eq 1
  end
end
