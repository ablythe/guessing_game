require './game'
require './player'
require './hangman'


puts "Choose mode"
puts "1) Guessing Game"
puts "2) Hangman"
choice = gets.chomp.to_i

if choice == 1
  game_class = Game
else
  game_class = Hangman
end

g = game_class.new

p = player_class.new
until g.over?
  guess = p.get_guess
  puts "You guessed: #{guess}"
  response =g.check_guess guess
  p.update_guess response
  puts response
end

puts "You lost" if g.lost?