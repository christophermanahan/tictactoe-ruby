class Player
  attr_reader :symbol

  def initialize(move_maker:, symbol:)
    @move_maker = move_maker
    @symbol = symbol
  end

  def make_move
    move_maker.get
  end

  private

  attr_reader :move_maker
end
