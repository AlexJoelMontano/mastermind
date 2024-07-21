require_relative('./gen')
require_relative('./linked_list')
require_relative('./save')

class Round
  def initialize
    @comp_choice = Gen.new.gen_numbers
    @input = Array.new(4)
    @results = Array.new(4)
    @total_correct = 0
    @total_number = 0
    @saving = false
  end

  def board
    num = 1
    board = Array.new(4)
    board.each_with_index do |number, index|
      board[index] = num
      num += 1
    end
    board.join(" | ")
  end

  def computer_choice
    @comp_choice
  end

  def player_choice
    @input.each_with_index do |number, index|
      print "Enter number for slot #{index + 1}: "
      player = gets.chomp
      if player.to_i > 10
        puts "***Number has to be a single digit***"
      else
        @input[index] = player
      end
    end
    puts "Press [Enter] for results or [s] to save and quit"
    saving = gets.chomp
    if saving == 's'
      @saving = true
    end
    @input
  end

  def show_choice
    @input.join(" | ")
  end

  def comparing
    @input.each_with_index do |number, index|

      if number.to_i == @comp_choice[index]
        @results[index] = "correct"
      elsif @comp_choice.include?(number.to_i)
        @results[index] = "yes"
      else
        @results[index] = "no"
      end

    end
    @results
  end
  def continuing
    @input.each_with_index do |number, index|

      if number.to_i == Save_computer[index]
        @results[index] = "correct"
      elsif Save_computer.include?(number.to_i)
        @results[index] = "yes"
      else
        @results[index] = "no"
      end

    end
    @results
  end

  def finding_results
    @results.each do |result|
      if result == "correct"
        @total_correct += 1
      elsif result == "yes"
        @total_number += 1
      else
        next
      end
    end
  end

  def results
    puts '---------------------------------------------------------------------------'
    puts "***  You guessed [ #{@total_correct} ] numbers in the CORRECT location           ***"
    puts "***  You guessed [ #{@total_number} ] numbers correct but in the WRONG location ***"
    puts "***  You have [ #{4 - @total_correct - @total_number} ] numbers INCORRECT                            ***"
    puts '---------------------------------------------------------------------------'
  end

  def win
    if @total_correct == 4
      return "win"
    end
  end
  def save_input
    if @saving == true
      return true
    end
  end
  def save_content
    "[ #{@total_correct} ] Correct  |  [ #{@total_number} ] incorrect space but correct  |  [ #{4 - @total_correct - @total_number} ] wrong | Your Choices and their location: **#{@input}**"
  end

  def round_reset
    @total_correct = 0
    @total_number = 0
end
end
