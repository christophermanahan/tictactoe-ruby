require './lib/presenter'

describe 'presenter' do
  class DisplayLogger
    attr_reader :log

    def initialize
      @log = []
    end

    def display(message)
      log << message
    end
  end

  class StubFormatter
    def format(board)
      "|#{board}|"
    end
  end

  class StubMessages
    def winning(player)
      "#{player} won"
    end

    def tied
      'tied'
    end

    def prompt(player)
      "#{player} prompt"
    end
  end

  class BoardGame
    def board
      'board'
    end
  end

  class WonGame < BoardGame
    def win?
      true
    end

    def tie?
      false
    end
  end

  class TieGame < BoardGame
    def win?
      false
    end

    def tie?
      true
    end
  end

  class ContinueGame < BoardGame
    def win?
      false
    end

    def tie?
      false
    end
  end

  class StubPlayer
    def symbol
      'X'
    end
  end

  let(:displayer) { DisplayLogger.new }

  let(:clear) { 'clear' }

  let(:player) { StubPlayer.new }

  context 'displays the appropriate content' do
    let(:presenter) do
      Presenter.new(
        displayer: displayer,
        clear: clear,
        formatter: StubFormatter.new,
        messages: StubMessages.new
      )
    end
    it 'clears the display' do
      presenter.present(game: ContinueGame.new, player: player)
      expect(displayer.log.first).to eq clear
    end

    it 'displays the formatted board' do
      presenter.present(game: ContinueGame.new, player: player)
      expect(displayer.log.include?('|board|')).to eq true
    end

    it 'displays the current player prompt message if the game is not over' do
      presenter.present(game: ContinueGame.new, player: player)
      expect(displayer.log.include?('X prompt')).to eq true
    end

    it 'displays the tie game message if the game is tied' do
      presenter.present(game: TieGame.new, player: player)
      expect(displayer.log.include?('tied')).to eq true
    end

    it 'displays the winning player message if the game is won' do
      presenter.present(game: WonGame.new, player: player)
      expect(displayer.log.last).to eq 'X won'
    end
  end
end
