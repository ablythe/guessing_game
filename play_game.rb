require './game'

g = Game.new
until g.over?
  puts "What is your Guess? "
  guess= gets.chomp.to_i

  response =g.check_guess guess
  puts response
end

puts "You lost" if g.lost?