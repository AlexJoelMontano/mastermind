require_relative('./lib/gen')
require_relative('./lib/game')

game = Game.new

round = 1

puts ''
puts '--------------------------'
puts '***    Welcome to     ***'
puts '***    Mastermind!    ***'
puts '--------------------------'
puts ''
puts '*Game Rules*: You have 12 rounds to try and guess the 4 computer generated numbers.'
puts 'You have to choose 4 numbers and you will be told if:'
puts '  -you have the correct number in the correct location'
puts '  -correct number but in the wrong location'
puts '  -or incorrect number.'
puts ''
puts '-Numbers are single digit only'
puts ''
puts 'Press Enter to Play!'
gets.chomp
game_over = false
until game_over == true
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
  round += 1
  if round == 12
    game_over = true
    puts ''
    puts '^^^^^^^^^^^^^^^^^^^^^^^^^^'
    puts '***    <Game Over>    ***'
    puts '*** THE COMPUTER WINS!***'
    puts '--------------------------'
    puts ''
  elsif game.results == "win"
    game_over = true
    puts ''
    puts '$$$ ******************* $$$'
    puts '$$$ *  -------------  * $$$'
    puts '$$$ *  |  You Win  |  * $$$'
    puts '$$$ *  -------------  * $$$'
    puts '$$$ ******************* $$$'
    puts ''
  end
  puts '___________________________________________________'
end
