require_relative('./gen')
require_relative('./hash_map')

class Round
  def initialize
    @comp_choice = Gen.new.gen_numbers
    @input = Array.new(4)
    @results = Array.new(4)
    @total_correct = 0
    @total_number = 0
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


  def player_choice
    @input.each_with_index do |number, index|
      print "Enter number for slot #{index + 1}: "
      input = gets.chomp.to_i
      if input > 10
        puts "***Warning number needs to be a single digit***"
        input
      elsif input.to_i == false
        @game_over = true
      else
        @input[index] = input
      end
    end
    @input
  end

  def comparing
    @input.each_with_index do |number, index|
      if number == @comp_choice[index]
        @results[index] = "correct"
      elsif @comp_choice.include?(number)
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
    puts "You guessed #{@total_correct} numbers in the correct location"
    puts "You guessed #{@total_number} numbers correct but in the wrong location"
    puts "You have #{4 - @total_correct - @total_number} numbers incorrect"
    if @total_correct == 4
      return "win"
    end
  end
  def saving
    "you got #{@total_correct} correct ,#{@total_number} incorrect space but correct, and #{4 - @total_correct - @total_number} wrong"
  end

  def round_reset
    @total_correct = 0
    @total_number = 0
end
end