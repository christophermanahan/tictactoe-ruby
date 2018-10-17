class Displayer
  def initialize(io)
    @io = io
  end

  def display(formatted_string)
    io.puts(formatted_string)
  end

  private
  attr_reader :io
end
