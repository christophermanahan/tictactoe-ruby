class Cell
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def fill(symbol)
    Cell.new(symbol)
  end

  def empty?
    symbol.nil?
  end
end
