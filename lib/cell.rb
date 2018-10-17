class Cell
  attr_reader :symbol

  def fill(symbol)
    @symbol = symbol
  end

  def empty?()
    symbol == nil
  end
end
