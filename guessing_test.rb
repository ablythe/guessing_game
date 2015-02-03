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
    assert_equal game.guesses_left, 5
  end

  def test_that_you_can_win
    game = Game.new
    response = game.check_guess game.answer
    assert_equal "You got it!", response
  end

  def test_that_you_can_lose
    game = Game.new
    6.times { game.check_guess 101}   
    assert_equal game.lost?, true
  end

  def test_can_win_on_last_turn
    game = Game.new
    5.times { game.check_guess 101}
    game.check_guess game.answer
    refute game.lost?
    assert game.won?
  end
end
