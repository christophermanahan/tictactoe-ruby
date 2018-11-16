class Colorizer
  def initialize(color_count)
    @color_count = color_count
  end

  def blue(string)
    colorize(string, 34)
  end

  def cyan(string)
    colorize(string, 36)
  end

  def yellow(string)
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
