class Cell
  attr_reader :symbol

  def set_symbol(symbol)
    @symbol = symbol
  end

  def empty?()
    symbol == nil
  end
end
