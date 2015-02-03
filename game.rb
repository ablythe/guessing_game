class Game
  def initialize
    @guesses_left = 6
    @answer = rand(1..100)
  end
  attr_reader :guesses_left, :answer

  def check_guess n 
    if n > @answer
      "Your guess was too high"
    elsif n < @answer
      "Your guess was too low"
    else
      "You got it!"
    end
  end
end