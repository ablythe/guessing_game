require './game'
require './player'

g = Game.new
p = DumbAi.new
until g.over?
  guess = p.get_guess
  puts "You guessed: #{guess}"
  response =g.check_guess guess
  puts response
end

puts "You lost" if g.lost?