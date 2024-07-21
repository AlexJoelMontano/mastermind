require_relative('./lib/gen')
require_relative('./lib/round')
require_relative('./lib/hash_map')
require 'yaml'

class Game
    def initialize
      @game_over = false
      @round = 1
      @play = Round.new
      @index = 0
      @save = Save
      @save_game = Array.new(12)
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
      puts 'Press Enter to Play!'
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
      @play.comparing
      @play.finding_results
      @round += 1
    end

    def play_game
      until @game_over == true
        round
        @save_game[@index] = "In round #{@round}: #{@play.saving}"
        if @round == 13
          @game_over = true
          puts ''
          puts '^^^^^^^^^^^^^^^^^^^^^^^^^^'
          puts '***    <Game Over>    ***'
          puts '*** THE COMPUTER WINS!***'
          puts '--------------------------'
          puts ''
        elsif @play.results == "win"
          @game_over = true
          puts ''
          puts '$$$ ******************* $$$'
          puts '$$$ *  -------------  * $$$'
          puts '$$$ *  |  You Win  |  * $$$'
          puts '$$$ *  -------------  * $$$'
          puts '$$$ ******************* $$$'
          puts ''
        end
        puts '___________________________________________________'
        @index += 1
        @play.round_reset
      end
    end

    def saved
      num_words = ["zero","one","two","three","four","five","six","seven","eight","nine","ten","eleven"]
          @save_game.each_with_index do |content,index|
            @save.set(num_words[index],content)
          end
    end
    def show
      num_words = ["zero","one","two","three","four","five","six","seven","eight","nine","ten","eleven"]
      num_words.each do |num|
        puts "Round #{@round}: #{@save.get(num)}"
      end
    end
end

master = Game.new
master.title
gets.chomp
master.play_game
master.saved
puts
input = gets.chomp
if input == 'save'
    master.show
end
