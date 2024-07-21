require_relative('./lib/gen')
require_relative('./lib/round')
require_relative('./lib/linked_list')
require_relative('./lib/save')
require 'yaml'

class Game
    def initialize
      @game_over = false
      @round = 1
      @play = Round.new
      @index = 0
      @save = LinkedList.new
      @save_game = Array.new(12)
      @file = "./lib/save.rb"
    end

    def title
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
      puts '***Numbers are single digit only***'
      puts ''
      puts 'Please choose:'
    end

    def round
      puts ''
      puts "Round #{@round}"
      puts ''
      puts '-----------------'
      puts "| #{@play.board} |"
      puts '-----------------'
      puts ''
      @play.player_choice
      puts ''
      puts "Your choices for round #{@round}"
      puts '-----------------'
      puts "| #{@play.show_choice} |"
      puts '-----------------'
      puts ''
      @play.comparing
      @play.finding_results
      puts "Your Results for round #{@round}"
      @play.results
      @round += 1
    end

    def play_game
      until @game_over == true
        puts '___________________________________________________________________________'
        round
        @save_game[@index] = "In round #{@round-1}: #{@play.save_content}"
        if @round == 13
          @game_over = true
          puts ''
          puts '^^^^^^^^^^^^^^^^^^^^^^^^^^'
          puts '***    <Game Over>    ***'
          puts '*** THE COMPUTER WINS!***'
          puts '--------------------------'
          puts ''
        elsif @play.win == "win"
          @game_over = true
          puts ''
          puts '$$$ ******************* $$$'
          puts '$$$ *  -------------  * $$$'
          puts '$$$ *  |  You Win  |  * $$$'
          puts '$$$ *  -------------  * $$$'
          puts '$$$ ******************* $$$'
          puts ''
        elsif @play.save_input == true
          @game_over = true
        end
        @index += 1
        @play.round_reset
      end
    end

    def write
      File.open(@file, 'w') { |file| file.write("Save_file = #{@save_game}") }
    end
end

master = Game.new
master.title
puts "Load saved game?(y) or New game?(n)"
choice = gets.chomp
if choice == 'y'
  puts Save_file
else
  master.play_game
  master.saved
  input = gets.chomp
  if input == 'save'
      master.write
  end
end
