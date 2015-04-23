require 'minitest/autorun'
require './hangman'

class HangmanTests < MiniTest::Test 
  def test_it_knows_guesses_remaining
    h = Hangman.new
    assert_equal h.guesses_left, 6
  end

  def test_it_counts_off_on_on_misses
    h = Hangman.new "banana"
    h.check_guess "c"
    assert_equal h.guesses_left, 5
    refute h.over?
  end

  def test_it_doesnt_count_off_for_correct
    h = Hangman.new "banana"
    h.check_guess "a"
    assert_equal h.guesses_left, 6
  end

  def test_it_can_display_the_board
    h = Hangman.new "banana"
    assert_equal h.board, "______"
    h.check_guess "a"
    assert_equal h.board, "_a_a_a"

    assert_equal h.answer, "******"
  end

  def test_that_you_can_win
    word = Hangman::Words.sample
    h=Hangman.new word
    word.split("").uniq.each { |letter| h.check_guess letter}

    assert h.won?
    refute h.lost?
  end

  def test_that_you_can_lose
    h = Hangman.new "papaya"
    misses = ['b','c','d','r','t','v']
    misses.each {|letter| h.check_guess letter}
    assert h.lost?
    assert h.over?
    refute h.won?

    assert_equal h.answer, "papaya"
  end
end