class UserInterface
  def initialize(formatter:, displayer:, input:)
    @formatter = formatter
    @displayer = displayer
    @input = input
  end

  def display(unformatted)
    formatted = formatter.format(unformatted)
    displayer.display(formatted)
  end

  def winner(symbol)
    displayer.display("#{symbol} won!")
  end

  def get_input
    input.get
  end

  private

  attr_reader :formatter, :displayer, :input
end
