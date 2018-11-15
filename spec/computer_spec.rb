require './lib/computer'

describe 'computer' do
  class SpyPauser
    attr_accessor :called

    def pause
      self.called = true
    end
  end

  class BlockGame
    def available_moves
      [1, 2, 3]
    end

    def move(to:, **)
      if to == 3
        WinGame.new
      else
        NoWinGame.new
      end
    end
  end

  class NoBlockGame
    def available_moves
      [1]
    end

    def move(*)
      NoWinGame.new
    end
  end

  class WinGame
    def string
      'blocked'
    end

    def win?
      true
    end
  end

  class NoWinGame
    def win?
      false
    end

    def string
      'available'
    end
  end

<<<<<<< HEAD
  it 'makes moves that block the opponent from winning next turn' do
    computer = Computer.new(symbol: 'X', opponent: 'O', pauser: SpyPauser.new)
    expect(computer.play(BlockGame.new).string).to eq 'blocked'
  end

  it 'makes the first available move if the opponent cannot win' do
    computer = Computer.new(symbol: 'X', opponent: 'O', pauser: SpyPauser.new)
    expect(computer.play(NoBlockGame.new).string).to eq 'available'
  end

  it 'pauses before making a move' do
    pauser = SpyPauser.new
    computer = Computer.new(symbol: 'X', opponent: 'O', pauser: pauser)
    computer.play(NoBlockGame.new)
    expect(pauser.called).to eq true
=======
  let(:pauser) { SpyPauser.new }

  context 'makes the correct moves after a pause' do
    let(:computer) { Computer.new(symbol: 'X', opponent: 'O', pauser: pauser) }

    it 'makes moves that block the opponent from winning next turn' do
      expect(computer.play(BlockGame.new).string).to eq 'blocked'
    end

    it 'makes the first available move if the opponent cannot win' do
      expect(computer.play(NoBlockGame.new).string).to eq 'available'
    end

    it 'pauses before making a move' do
      computer.play(NoBlockGame.new)
      expect(pauser.called).to eq true
    end
>>>>>>> c268207... Add computer player
  end
end
