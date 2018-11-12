class Player
  attr_reader :symbol, :move_message, :win_message

  def initialize(move_maker:, symbol:, move_message:, win_message:)
    @move_maker = move_maker
    @symbol = symbol
    @move_message = move_message
    @win_message = win_message
  end

  def make_move
    move_maker.get
  end

  private

  attr_reader :move_maker
end
