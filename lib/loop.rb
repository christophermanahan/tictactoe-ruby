class Loop
  def initialize(game:, players:, presenter:)
    @game = game
    @players = players
    @presenter = presenter
  end

  def run
    play
    continue?
  end

  private

  attr_reader :game, :players, :presenter

  def present
    presenter.present(game: game, player: players.peek)
  end

  def play
    players.next
    present
    players.peek.play(game)
  end

  def continue?
    present
    run unless game.over?
  end
end
