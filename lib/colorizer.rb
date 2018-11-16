class Colorizer
  def initialize(color_count)
    @color_count = color_count
  end

  def symbol_1(string)
    colorize(string, 34)
  end

  def symbol_2(string)
    colorize(string, 36)
  end

  def position(string)
    colorize(string, 33)
  end

  private

  attr_reader :color_count

  def supported?
    color_count >= 8
  end

  def colorize(string, code)
    supported? ? "\e[#{code}m#{string}\e[0m" : string
  end
end
