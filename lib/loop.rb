class Loop
  def initialize(game:, players:, presenter:)
    @game = game
    @players = players
    @presenter = presenter
  end

  def run
    present
    play
    continue?
  end

  private

  attr_reader :game, :players, :presenter

  def present
    presenter.present(game: game, player: players.peek)
  end

  def play
    players.peek.play(game)
    players.next
  end

  def continue?
    run unless game.over?
  end
end
