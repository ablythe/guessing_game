class Player
  def get_guess
    print "What is your guess? "
    gets.chomp.to_i
  end

  def update_guess a 
  end
end

class DumbAi < Player
  def get_guess
    rand 1.. 100
  end
end

class SmartAi < Player
  def initialize
    @low = 0
    @high = 100
    @last_guess = nil
  end

  def get_guess
    new_guess = (@low + @high) /2
    @last_guess = new_guess
  end  

  def update_guess response
    if response.include? "high"
      @high = @last_guess
    elsif response.include? "low"
      @low = @last_guess
    end
  end
end
