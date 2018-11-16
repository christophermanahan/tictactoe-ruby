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

  attr_reader :color_count, :colorize_function

  def colorize(string, code)
    supported? ? ansi_wrapper(string, code) : string
  end

  def supported?
    color_supported_threshold = 1
    color_count > color_supported_threshold
  end

  def ansi_wrapper(string, code)
    "\e[#{code}m#{string}\e[0m"
  end
end
