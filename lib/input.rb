class Input
  def initialize(io)
    @io = io
  end

  def get
    io.gets
  end

  private

  attr_reader :io
end
