class Colorizer
  def initialize(supported, colorize_function)
    @supported = supported
    @colorize_function = colorize_function
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

  attr_reader :supported, :colorize_function

  def colorize(string, code)
    supported ? colorize_function.call(string, code) : string
  end
end
