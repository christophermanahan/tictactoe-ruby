class Pauser
  def initialize(pause_function, time)
    @pause_function = pause_function
    @time = time
  end

  def pause
    pause_function.call(time)
  end

  private

  attr_reader :pause_function, :time
end
