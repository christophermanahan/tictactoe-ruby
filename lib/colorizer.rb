class Colorizer
  def magenta(string)
    "#{string} \e[35mMagenta"
  end

  def blue(string)
    "#{string} \e[34mBlue"
  end

  def cyan(string)
    "#{string} \e[36mCyan"
  end
end
