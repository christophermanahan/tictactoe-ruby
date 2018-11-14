class Human
  def initialize(input)
    @input = input
  end

  def move(_game)
    # Perform validation here using game, rename input to reflect
    input.get
  end

  private

  attr_reader :input
end
