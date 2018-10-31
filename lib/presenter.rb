class Presenter
  def initialize(displayer:, clear:, formatter:)
    @displayer = displayer
    @clear = clear
    @formatter = formatter
  end

  def present(board:, message:)
    board = formatter.format(board)
    [clear, board, message].each do |render|
      displayer.display(render)
    end
  end

  private

  attr_reader :displayer, :clear, :formatter
end
