class Displayer
  def initialize(io)
    @io = io
  end

  def display(out)
    io.puts(out)
  end

  private

  attr_reader :io
end
