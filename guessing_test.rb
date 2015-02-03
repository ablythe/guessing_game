require 'minitest/autorun'
require './game'

class GuessingTests < Minitest::Test 
  def test_it_knows_guesses_remaining
    game = Game.new
    assert_equal game.guesses_left, 6
  end

  def test_it_has_answer
    game = Game.new
    assert game.answer.is_a? Integer
  end

  def test_lets_you_know_if_you_guessed_too_high
    game = Game.new
    response =game.check_guess 101
    assert_equal "Your guess was too high", response
  end
end
