class Presenter
  def initialize(displayer:, clear:, formatter:, messages:)
    @displayer = displayer
    @clear = clear
    @formatter = formatter
    @messages = messages
  end

  def present(game:, player:)
    [clear, formatter.format(game), message(game, player)].each do |render|
      displayer.display(render)
    end
  end

  private

  attr_reader :displayer, :clear, :formatter, :messages

  def message(game, player)
    if game.win?
      messages.winning(player.symbol)
    elsif game.tie?
      messages.tied
    else
      messages.prompt(player.symbol)
    end
  end
end
