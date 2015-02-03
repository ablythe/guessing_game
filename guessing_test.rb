require 'minitest/autorun'
require './game'

class GuessingTests < Minitest::Test 
  def test_it_knows_guesses_remaining
    game = Game.new
    assert_equal game.guesses_left, 6
  end
end
