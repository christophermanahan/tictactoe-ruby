class UserInterface
  def initialize(board_formatter:, displayer:, input:)
    @board_formatter = board_formatter
    @displayer = displayer
    @input = input
  end

  def display_board(rows)
    formatted_board = board_formatter.format_board(rows)
    displayer.display(formatted_board)
  end

  def get
    input.get
  end

  private

  attr_reader :board_formatter, :displayer, :input
end
