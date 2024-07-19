require_relative('./lib/gen')
require_relative('./lib/game')

game = Game.new

round = 1

puts 'Welcome to Mastermind!'
puts ''
puts 'Game Rules: You have 12 rounds to try and guess the 4 computer generated numbers.'
puts 'You have to choose 4 numbers and you will be told if:'
puts '  -you have the correct number in the correct location'
puts '  -correct number but in the wrong location'
puts '  -or incorrect number.'
puts ''
puts 'Press Enter to Play!'
gets.chomp

until round == 12 || game.win == true
  puts ''
  puts "Round #{round}"
  puts ''
  puts '-----------------'
  puts "| #{game.board} |"
  puts '-----------------'
  puts ''
  game.player_choice
  puts ''
  game.comparing
  game.results
  puts '___________________________________________________'
  round += 1
end
