class Gen
  def initialize
    @numbers = Array.new(4)
  end

  def gen_numbers
    @numbers.each_with_index do |number, index|
      number = rand(1..9)
      if @numbers.include?(number) && number < 9
        @numbers[index] = number + 1
      elsif @numbers.include?(number) && number == 9
        @numbers[index] = number - rand(1..8)
      else
        @numbers[index] = number
      end
        puts @numbers[index]
    end
  end

end
