require 'io/console'

class Input
  def initialize(io)
    @io = io
  end

  def get
    io.iflush
    io.gets
  end

  private

  attr_reader :io
end
