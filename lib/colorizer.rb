class Colorizer
  def magenta(string)
    "\e[35m#{string}\e[0m"
  end

  def cyan(string)
    "\e[36m#{string}\e[0m"
  end

  def yellow(string)
    "\e[33m#{string}\e[0m"
  end
end
