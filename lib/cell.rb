class Cell
  attr_accessor :symbol

  def fill(symbol)
    self.symbol = symbol
  end

  def empty?
    symbol.nil?
  end
end
