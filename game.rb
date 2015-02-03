class Game
  def initialize
    @guesses_left = 6
    @answer = rand(1..100)
    @won = false
  end
  attr_reader :guesses_left, :answer

  def check_guess n 
    if n > @answer  
      @guesses_left -= 1
      "Your guess was too high"
    elsif n < @answer
      @guesses_left -= 1
      "Your guess was too low"
    else
      @won =  true
      "You got it!"
    end
  end

  def lost?
    @guesses_left <= 0
  end

  def won?
    @won
  end

  def over?
    won? || lost?
  end
end