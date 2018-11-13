require './lib/pauser'

describe 'pauser' do
  def mock_sleep(time)
    "sleeping for #{time} seconds"
  end

  it 'pauses for a specified amount of time' do
    pauser = Pauser.new(lambda { |time| mock_sleep(time) }, '0')
    expect(pauser.pause).to eq 'sleeping for 0 seconds'
  end
end
