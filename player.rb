class Player
  def get_guess
    print "What is your guess? "
    gets.chomp.to_i
  end
end

class DumbAi
  def get_guess
    rand 1.. 100
  end
end