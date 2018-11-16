class Messages
  def winning(player)
    "#{player} has won"
  end

  def tied
    'The game ended in a tie'
  end

  def prompt(player)
    "Please make a selection for #{player}"
  end
end
