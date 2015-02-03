require './game'
require './player'

g = Game.new
puts "Choose mode"
puts "1) Human"
puts "2) DumbAi"
puts "3) SmartAi"
choice = gets.chomp.to_i

player_class = if choice == 1
  Player
elsif choice  == 2
  DumbAi
else
  SmartAi
end

p = player_class.new
until g.over?
  guess = p.get_guess
  puts "You guessed: #{guess}"
  response =g.check_guess guess
  p.update_guess response
  puts response
end

puts "You lost" if g.lost?